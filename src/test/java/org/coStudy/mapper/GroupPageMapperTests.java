package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.GroupPageBoardVO;
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
public class GroupPageMapperTests {
	@Setter(onMethod_ = @Autowired)
	private GroupPageMapper mapper;

	// @Test
	// public void setup(){
	// log.info("mapper받아옴:"+mapper);
	// }

	@Test
	public void groupBoardList() {
		List<GroupPageBoardVO> list = mapper.groupBoardList(1);
		log.info(list);
		
		}

}