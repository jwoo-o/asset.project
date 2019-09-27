package com.core.service.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.CommonDto;
import com.core.vo.DeptViewDto;
import com.core.vo.DeptVo;

	

@Repository
public class DeptDao {

	@Inject
	private SqlSession session;
	
	public void insert(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		session.insert("dept.insert",vo);
	}

	public List<DeptViewDto> select(CommonDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("dept.select",dto);
	}

	public int selectDCount(CommonDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("dept.selectCount",dto);
	}

	public List<DeptVo> selectMgr(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("dept.selectMgr",vo);
	}


	public DeptViewDto selectDtl(DeptViewDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("dept.selectDtl",dto);
	}

	public List<DeptViewDto> selectSubDept(DeptViewDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("dept.selectSubList",dto);
	}

	public List<Map<String, Object>> selectOrgChart(String country) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("dept.selectOrgChart",country);
	}

	public List<DeptViewDto> selectDeptSearch() throws SQLException {
		// TODO Auto-generated method stub 
		return session.selectList("dept.selectDeptSearch");
	}
	public int selectCountry(String country)throws SQLException {
		return session.selectOne("dept.selectCountry",country);
	}

	public DeptViewDto selectCEO() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("dept.selectCEO");
	}

	public List<DeptViewDto> selectDivision() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("dept.selectDivision");
	}

	public DeptVo selectMgrEmp(String empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("dept.selectMgrEmp",empNo);
	}

	public int selectLevel(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("dept.selectLevel",vo);
	}

	public void update(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		session.update("dept.update",vo);
	}
	public Map<String,String> selectHighLevel(int dept_no)throws SQLException{
		
		return session.selectOne("dept.selectHighLevel",dept_no);
	}

	

}
