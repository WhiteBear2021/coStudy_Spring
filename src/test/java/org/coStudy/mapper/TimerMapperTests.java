package org.coStudy.mapper;

import org.coStudy.domain.TimerVO;
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

public class TimerMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private TimerMapper mapper;
	
	@Test
	public void insertTest(){
		log.info(mapper);
		TimerVO vo = new TimerVO();
		vo.setTime("01:10:59");
		vo.setUser_no(3);
		
		log.info("타이머 insert"+mapper.insert(vo));
	}
	
}
