package org.coStudy.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
public class MainPageMapperTests {
	@Setter(onMethod_=@Autowired)
	private  MainPageMapper mapper;
	
	/*@Test
	public void getNewTest(){
		mapper.getNew().forEach(action -> log.info(action));
	}*/
	
	/*@Test
	public void getTest(){

		Random rn = new Random();
		List<StudyGroupVO> list = mapper.list();
		
		int ran = rn.nextInt(list.size());
		
		log.info(list.get(ran));
	
	}*/
	
	/*@Test
	public void getHotTest(){
		mapper.getHot().forEach(action -> log.info(action));
	
	}*/
	
	@Test
	public void getRecomTest(){
		mapper.getRecom(1).forEach(action -> log.info(action));
	
	}
}
