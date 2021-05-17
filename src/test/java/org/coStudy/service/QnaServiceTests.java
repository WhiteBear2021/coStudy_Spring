package org.coStudy.service;

import static org.junit.Assert.assertNotNull;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.NoticeVO;
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
public class QnaServiceTests {
	@Setter(onMethod_ = @Autowired)
	private QnaService service;

/*	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}*/

	@Test
	public void testInsert() {

		QnaVO qna = new QnaVO();
		qna.setQna_content("qna test content");
		qna.setQna_title("qna test title");
		qna.setUser_no(1);

		service.Userinsert(qna);
		log.info("==========================");
		log.info("test user insert 작업:" + qna);
		log.info("생성된 게시물의 번호: " + qna.getQna_no());
	}

	/*
	 * @Test public void testList() {
	 * 
	 * service.list().forEach(notice -> log.info(notice));
	 * 
	 * }
	 */

	/*
	 * @Test public void testDetail() { log.info(service.detail(39)); }
	 */
	/*
	 * @Test public void testDelete() { log.info("REMOVE RESULT: " +
	 * service.delete(39));
	 * 
	 * }
	 */

	/*
	 * @Test public void testUpdate() {
	 * 
	 * NoticeVO notice = service.detail(70);
	 * 
	 * if (notice == null) { return; }
	 * 
	 * notice.setNotice_title("제목 수정합니다."); log.info("MODIFY RESULT: " +
	 * service.update(notice)); }
	 */

	/*
	 * @Test public void testGetList() {
	 * 
	 * service.list(new Criteria(2, 10)).forEach(board -> log.info(board)); }
	 */

}
