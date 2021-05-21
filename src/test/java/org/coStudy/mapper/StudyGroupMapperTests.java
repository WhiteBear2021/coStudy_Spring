package org.coStudy.mapper;
import org.coStudy.domain.StudyGroupVO;
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
public class StudyGroupMapperTests {
	@Setter(onMethod_=@Autowired)
	private  StudyGroupMapper mapper;
	
/*	@Test
	public void setup(){
		log.info("mapper받아옴:"+mapper);
	}*/
	
	@Test
	public void testInsert() {

		StudyGroupVO st = new StudyGroupVO();

		st.setStudygroup_no(2);
		st.setStudygroup_name("aaaa");
		st.setStudygroup_info("aaaaa");
		st.setStudygroup_location("서울");
		st.setMax_user_number(4);
		st.setIsface("N");
		st.setCategory_no(1);
		st.setUser_no(1);
		
		
		mapper.insert(st);

/*		log.info("test insdrt 작업:" + notice);
*/	}
}
