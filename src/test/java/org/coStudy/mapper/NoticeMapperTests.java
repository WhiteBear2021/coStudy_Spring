package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.NoticeVO;
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
public class NoticeMapperTests {
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;

	@Test
	public void setup() {
		log.info("mapper받아옴:" + mapper);
	}

/*	@Test
	public void testList() {
		mapper.list().forEach(board -> log.info(board));
	}*/

/*	@Test
	public void testInsert() {

		NoticeVO notice = new NoticeVO();
		notice.setNotice_title("notice test title");
		notice.setNotice_content("notice test content");

		mapper.insert(notice);

		log.info("test insdrt 작업:" + notice);
	}*/
	
/*	@Test
	public void testDetail(){
		NoticeVO notice=mapper.detail(16);
		log.info("test detail 작업:"+notice);
	}*/
	
/*	@Test
	public void testDelete(){
		int deleteCount=mapper.delete(68);
		log.info("test delete 작업:"+deleteCount);
	}*/
	
/*	@Test
	public void testUpdate() {

		NoticeVO notice = new NoticeVO();
		notice.setNotice_no(39);
		notice.setNotice_title("notice test title");
		notice.setNotice_content("notice test content");

		mapper.update(notice);

		log.info("test update 작업:" + notice);
	}
	*/
/*	@Test
	public void testPaging() {

		Criteria cri = new Criteria();
		
	    //10개씩 3페이지 
	    cri.setPageNum(3);
	    cri.setAmount(10);
		
		List<NoticeVO> list=mapper.list(cri);
		
		list.forEach(lists-> log.info(list));

	}*/
}
