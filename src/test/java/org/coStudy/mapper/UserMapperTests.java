package org.coStudy.mapper;
import java.util.HashMap;
import java.util.List;

import org.coStudy.domain.CategoryVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	@Setter(onMethod_=@Autowired)
	private  UserMapper mapper;
	
	@Test
	public void setup(){
		log.info("mapper받아옴:"+mapper);
	}
	
//	@Test
//	public void categoryListTest(){
//		List<CategoryVO> list=mapper.categoryAllList();
//		log.info(list);
//	}
//	
//	@Test
//	public void searchIdTest(){
//		log.info("searchId test");
//		HashMap<String, String> map=new HashMap<>();
//		map.put("user_firstName", "sta");
//		map.put("user_lastName", "Ko");
//		map.put("user_phoneNo", "010-1234-5676");
//		
//		String user_id=mapper.searchId(map);
//		log.info(user_id);
//	}
//
	//비민번호 찾기 테스트
	@Test
	public void searchPwTest(){
		log.info("searchPw test");
		HashMap<String, String> map=new HashMap<>();
		map.put("user_id", "phyw1129");
		map.put("user_email", "phyw1129@naver.com");
		
		String user_pw=mapper.searchPw(map);
		log.info(user_pw);
	}
}