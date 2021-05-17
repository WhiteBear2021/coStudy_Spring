package org.coStudy.mapper;

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
	@Setter(onMethod_=@Autowired)
	private  GroupPageMapper mapper;
	
//	@Test
//	public void setup(){
//		log.info("mapper받아옴:"+mapper);
//	}
	
	@Test
	public void insertTest(){
		GroupPageBoardVO vo = new GroupPageBoardVO();
		vo.setPage_board_content("아아");
		vo.setPage_board_title("아아아");
		vo.setPage_board_writer("앙아");
		vo.setStudyGroup_no(1);
		log.info("======="+mapper.insertGroupBoard(vo)+"======");
	}
}