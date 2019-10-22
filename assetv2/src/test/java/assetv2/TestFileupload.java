package assetv2;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import com.core.service.dao.DeptDao;
import com.core.util.DateUtillity;
import com.core.util.JsonUtil;
import com.emp.service.dao.EmpDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestFileupload {

	
	@Inject
	private DeptDao dao;

	@Inject
	private EmpDao edao;
	
	@Inject
	private TemplateEngine templateEngine;
	
	public final static Logger logger = LoggerFactory.getLogger(TestFileupload.class);
	
	
	@Test
	public void test() {
		
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();

			
			map.put("tree", JsonUtil.convertorTreeMap(dao.selectOrgChartAll(), 0, "dept_no", "dept_mgr_no", "dept_nm"));
			map.put("emp", edao.selectOrgListAll());
			map.put("count", edao.selectCountryCount());
			
			Context context = new Context();
			context.setVariable("data", map);
			context.setVariable("date", "["+DateUtillity.currnetDate()+"]기준");
			
			String data = templateEngine.process("orgchart", context);
			
			
			//File file = new File(orgchartPath+"/"+DateUtillity.currnetDate()+"_orgchart.html");
			File file = new File("C:\\"+DateUtillity.currnetDate()+"_orgchart.html");
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(data.getBytes());
			fos.close();
			
		}catch (Exception e) {
			// TODO: handle exception
			
			logger.error(e.getMessage(),e);
		}
	}
}
