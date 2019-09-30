package com.core.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.core.service.CoreService;
import com.core.service.DeptService;
import com.core.service.dao.DeptDao;
import com.core.util.JsonUtil;
import com.core.vo.CommonDto;
import com.core.vo.DeptViewDto;
import com.core.vo.DeptVo;
import com.core.vo.ManagerDto;
import com.emp.service.dao.EmpDao;
import com.emp.vo.EmpVo;
import com.emp.vo.SearchDto;

@Service
public class DeptServiceImpl extends CoreService implements DeptService {

	@Inject
	private DeptDao dao;

	@Inject
	private EmpDao edao;

	@Override
	public Map<String, Object> insDept(DeptVo vo, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		vo.setFstRgtWkrNm(manager.getmName());
		vo.setLstMdfWkrNm(manager.getmName());
		if (vo.getEmp_no() != null) {
			EmpVo empVo = edao.selectEmp(vo.getEmp_no());
			if (empVo == null) {
				map.put("msg", "올바른 사원번호를 입력하세요");
				return map;
			}
		}
		// insert
		if (vo.getStatus().equals("C")) {

			dao.insert(vo);
			map.put("msg", "0001");
			map.put("dept", vo);

			// update
		} else {

			DeptViewDto dto = new DeptViewDto();
			
			dto.setDept_no(vo.getDept_mgr_no());
			dto = dao.selectDtl(dto);
			
			if(Integer.parseInt(dto.getOrg_no())>=Integer.parseInt(vo.getOrg_no())){
				
				map.put("msg", "상위부서보다 같거나 높은 조직으로는 변경 할 수 없습니다.");
				return map;
			}
			
			dto.setDept_no(vo.getDept_no());

			dto = dao.selectDtl(dto);
			// 상위부서 수정시
			if (vo.getDept_mgr_no() != dto.getDept_mgr_no()) {
				// dept_no = 최상위 부서일때
				if (dto.getMgr_org_nm().equals("Country")) {

					// 최상위부서에서 하위부서 변경시
					if (!vo.getMgr_org_nm().equals("Country")) {

						// 부서가 division일때
						if (vo.getOrg_no().equals("3")) {
							// 최상위부서부터 four_dept까지 수정
							edao.updateHighLevelDept(vo);

						}
						// 부서가 group일때
						if (vo.getOrg_no().equals("4")) {

							dto.setDept_no(vo.getDept_mgr_no());
							dto = dao.selectDtl(dto);
							// 수정된 부모가 최상위 부서일때
							if (dto.getMgr_org_nm().equals("Country")) {
								// 최상위부서부터 four_dept까지 수정
								edao.updateHighLevelDept(vo);

							}
							// 수정된 부모가 최상위 부서가 아닐때(unit 안에 division일 경우)
							else {
								data.put("first_dept", dto.getDept_mgr_no());
								data.put("division", vo.getDept_no());
								data.put("second_dept", vo.getDept_mgr_no());
								edao.updateSecondLevelDept(data);

							}
						}

					}
					
					
					// dept_no - 최상위 부서가 아닐때
				} else {
					// 최상위부서로 변경시
					if (vo.getMgr_org_nm().equals("Country")) {

						if (vo.getOrg_no().equals("3")) {
							// 최상위부서부터 four_dept까지 수정
							// edao.updateHighLevelDept(vo);
							edao.updateDownSecondLevelDept(vo);

						}
						// 부서가 group일때
						if (vo.getOrg_no().equals("4")) {

							// second_dept 일경우 second_dept부터 최상위부서로 수정
							if (edao.updateDownSecondLevelDept(vo) == 0) {

								// three_dept 일경우 three_dept부터 최상위부서로 수정
								edao.updateDownThreeLevelDept(vo);

							}
						}

					} else {
						// dto.setDept_no(vo.getDept_mgr_no());
						// dto = dao.selectDtl(dto);
						Map<String, String> parents_data = dao.selectHighLevel(vo.getDept_mgr_no());

						// if (dto.getMgr_org_nm().equals("Country")) {
						if (parents_data.get("d2_org_no").equals("1")) {

							// 최상위부서부터 four_dept까지 수정

							// 하위 division second_level group,second_level team 최상위부서 하위부서로 변경시
							if (edao.updateChangefirstLevelDept(vo) == 0) {

								// three_level group,team 최상위부서 하위부서로 변경시
								if (edao.updateChangeSecondLevelDept(vo) == 0) {
									// four_level team 최상위부서 하위부서로 변경시
									edao.updateChangeThreeLevelDept(vo);
								}
							}

						} else {

							if (parents_data.get("d2_org_no").equals("2")) {

								// 수정된 부모가 최상위 부서가 아닐때(unit 안에 division일 경우)

								// EmpVo emp = new EmpVo();
								data.put("first_dept", parents_data.get("d2_no"));
								data.put("division", vo.getDept_no());
								data.put("second_dept", vo.getDept_mgr_no());

								if (edao.updateThreeLevelDept(data) == 0) {
									if (edao.updateFourLevelDept(data) == 0) {
										edao.updateFiveLevelDept(data);
									}
								}
							//team
							} else {
								//three_dept로 변경시
								if (parents_data.get("d2_org_no").equals("3")) {
									data.put("first_dept", parents_data.get("d2_no"));
									data.put("division", vo.getDept_no());
									data.put("second_dept", vo.getDept_mgr_no());
									edao.updateTeamThreeDept(data);
										
								}
								//four_dept로 변경시
								if (parents_data.get("d1_org_no").equals("2")) {
									
									data.put("first_dept", parents_data.get("d1_no"));
									data.put("division", vo.getDept_no());
									data.put("second_dept", parents_data.get("d2_no"));
									data.put("three_dept", vo.getDept_mgr_no());
									edao.updateTeamFourDept(data);
									
								}
							}

						}

					}

				}

			}
			dao.update(vo);
			map.put("msg", "0001");
		}

		return map;
	}

	@Override
	public Map<String, Object> selDept(CommonDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		dto.setNext((dto.getNext() - 1) * 10);
		List<DeptViewDto> list = dao.select(dto);
		int next = dao.selectDCount(dto);

		if (next % 10 > 0) {
			next = next / 10 + 1;
		} else {
			next = next / 10;
		}

		if (list != null) {
			map.put("msg", "0001");
			map.put("list", list);
			map.put("next", next);
		}
		return map;
	}

	@Override
	public Map<String, Object> selMgrDept(DeptVo vo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("country", vo.getCountry());
		map.put("msg", "0001");
		map.put("list", dao.selectMgr(vo));
		map.put("emp_list", edao.selectDeptMgr(map));

		return map;
	}

	@Override
	public Map<String, Object> selOrgChart(String country) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("tree", JsonUtil.convertorTreeMap(dao.selectOrgChart(country), 0, "dept_no", "dept_mgr_no", "dept_nm"));
		map.put("emp", edao.selectOrgList(country));
		map.put("count", edao.selectEmpCount(country));
		map.put("msg", "0001");

		return map;
	}

	@Override
	public Map<String, Object> selDeptDtl(DeptViewDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("dept", dao.selectDtl(dto));
		map.put("sub_dept", dao.selectSubDept(dto));
		map.put("msg", "0001");

		return map;
	}

	/** 부서명 코드 검색 */
	@Override
	public List<DeptViewDto> selDeptSearch() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectDeptSearch();
	}

	@Override
	public Map<String, Object> selEmpEditDept(Map<String, Object> data) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// TODO Auto-generated method stub
		DeptViewDto dto = new DeptViewDto();

		List<DeptViewDto> first_dept = new ArrayList<DeptViewDto>();
		if (data.get("first_dept") != null) {
			if (!data.get("first_dept").equals("")) {
				int country_dept_no = dao.selectCountry((String) data.get("first_dept"));
				dto.setDept_no(country_dept_no);
				first_dept = dao.selectSubDept(dto);

			}
			first_dept.add(dao.selectCEO());

		}

		List<DeptViewDto> second_dept = new ArrayList<DeptViewDto>();
		if (data.get("second_dept") != null) {
			logger.debug("second_dept : {}", data.get("second_dept"));
			dto.setDept_no((int) data.get("second_dept"));
			if (dto.getDept_no() > 0) {
				second_dept = dao.selectSubDept(dto);
			}

		}

		List<DeptViewDto> three_dept = new ArrayList<DeptViewDto>();
		if (data.get("three_dept") != null) {
			logger.debug("three_dept : {}", data.get("three_dept"));
			dto.setDept_no((int) data.get("three_dept"));
			if (dto.getDept_no() > 0) {
				three_dept = dao.selectSubDept(dto);
			}

		}

		List<DeptViewDto> four_dept = new ArrayList<DeptViewDto>();
		if (data.get("four_dept") != null) {
			logger.debug("four_dept : {}", data.get("four_dept"));
			dto.setDept_no((int) data.get("four_dept"));
			if (dto.getDept_no() > 0) {
				four_dept = dao.selectSubDept(dto);
			}

		}

		map.put("first_dept", first_dept);
		map.put("second_dept", second_dept);
		map.put("three_dept", three_dept);
		map.put("four_dept", four_dept);
		map.put("msg", "0001");

		return map;
	}

	@Override
	public List<DeptViewDto> selDivisionSearch() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectDivision();
	}

	@Override
	public Map<String, Object> delDept(DeptViewDto dto, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		dto.setLstMdfWkrNm(manager.getmName());
		SearchDto searchDto = new SearchDto();
		
		searchDto.setPage(0);
		searchDto.setLimit(10);
		searchDto.setKeyword("dept");
		searchDto.setSearch(dto.getDept_no()+"");
		List<EmpVo> emp_list = new ArrayList<EmpVo>();
		List<DeptViewDto> dept_list = new ArrayList<DeptViewDto>();
		emp_list = edao.selectList(searchDto);
		dept_list = dao.selectSubDept(dto);
		if(emp_list.size()>0) {
			map.put("msg", "해당 부서에 부서원들이 있습니다.\n부서원의 부서코드를 변경 후 삭제바랍니다.");
		}else if(dept_list.size()>0){
			map.put("msg", "하위부서의 상위부서코드 변경 후 삭제바랍니다.");
		}else {
			
			if(dao.delete(dto)>0) {
				map.put("msg", "0001");
			}
			map.put("msg", "요청이 실행되지 않았습니다.");
		}
		
		
		return map;
	}

}
