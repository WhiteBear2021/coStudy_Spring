package org.coStudy.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChattingMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ChattingMapper mapper;
	

//	@Test
//	public void testInsert(){
//		MessageVO vo = new MessageVO();
//		vo.setGroup_msg_log("test3 입니다.");
//		vo.setStudygroup_no(101);
//		vo.setUser_no(42);
//		log.info("=========insert========");
//		log.info("결과: "+mapper.insert(vo));
//	}

	@Test
	public void testList(){
		log.info("=========List========");
		List<MessageVO> vo = mapper.list(101);
		vo.forEach(chat -> log.info(chat));
		log.info("=================");
	}

}
