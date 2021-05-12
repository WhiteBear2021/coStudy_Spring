package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.MessageVO;
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
public class ChattingServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ChattingService service;
	
//	@Test
//	public void testInsert(){
//		MessageVO vo = new MessageVO();
//		vo.setGroup_msg_log("service test입니다.");
//		vo.setGroup_chatting_no(1);
//		
//		log.info("=========insert========");
//		log.info(service.insert(vo));
//	}
	
	
	@Test
	public void testList(){
		log.info("=========List========");
		List<MessageVO> vo = service.list(1);
		vo.forEach(chat -> log.info(chat));
		log.info("=================");
	}

}
