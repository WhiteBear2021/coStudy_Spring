package org.coStudy.mapper;
import java.util.List;import org.coStudy.controller.QnaController;
import org.coStudy.domain.QnaVO;
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
public class QnaMapperTests {
	@Setter(onMethod_=@Autowired)
	private  QnaMapper mapper;
	
/*	@Test
	public void setup(){
		log.info("mapper받아옴:"+mapper);
	}*/
	
/*	@Test
	public void testInsert() {

		QnaVO qna = new QnaVO();
		qna.setQna_content("qna test content");
		qna.setQna_title("qna test title");
		qna.setUser_no(1);
		
		mapper.UserInsert(qna);
		log.info("==========================");
		log.info("test user insert 작업:" + qna);
	}*/
	
	@Test
	public void testList() {

/*		QnaVO qna = new QnaVO();
		
		
		List<QnaVO> list=mapper.list(1);*/
		log.info("==========================");
		mapper.UserList(1).forEach(qna->log.info(qna));

	}
}
