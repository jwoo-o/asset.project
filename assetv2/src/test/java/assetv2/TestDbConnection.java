package assetv2;

import java.util.Map;

import javax.inject.Inject;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.core.service.dao.DeptDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestDbConnection {

	@Inject
	private DeptDao dao;
	
	public final static Logger logger = LoggerFactory.getLogger(TestDbConnection.class);
	
	
	@Test
	public void test() {
		
		try {
		Map<String, String> map = dao.selectHighLevel(55);
	
		
		if(map.get("d2_org_no").equals("2")) {
			System.out.println("ok");
		}
			
	
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
	}
}
