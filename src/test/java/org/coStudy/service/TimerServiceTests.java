package org.coStudy.service;

import org.coStudy.domain.TimerVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TimerServiceTests {
	@Setter(onMethod_ = @Autowired)
	TimerService service;
	
//	@Test
//	public void testInsert(){
//		TimerVO vo = new TimerVO();
//		vo.setTime("01:10:00");
//		vo.setUser_no(3);
//		log.info("=======service test=======");
//		log.info("성공? "+service.insert(vo));
//	}
	
	@Test
	public void testInsert(){
		service.list(1).forEach(action -> log.info(action));
	}
}
