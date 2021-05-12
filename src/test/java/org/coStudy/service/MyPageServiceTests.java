package org.coStudy.service;

import java.util.List;import javax.print.attribute.standard.JobOriginatingUserName;

import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.StudyNoteVO;
import org.coStudy.domain.UserVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyPageServiceTests {
	
	@Setter(onMethod_={@Autowired})
	MyPageService service;
	
	@Test
	public void serviceTest(){
		log.info(service);
	}
	
	@Test
	public void updateUserTest(){
		UserVO user=new UserVO(1, 1, "kosta211", "k1234", "수정하는 last name2", "수정하는 first name2", "010-1111-1111", "43210", "서울2", "강의실2", null, "WhiteBear2021@github2.com", null);
		int re=service.updateUser(user);
		log.info("update User 횟수:"+re);
	}
	
	@Test
	public void writeStudyDiaryTest(){
		StudyNoteVO studyNote=new StudyNoteVO(0, "공부", "팀프로젝트 잘 할 수 있을까?", null, null, 1);
		int re=service.writeStudyDiary(studyNote);
		log.info("작성한 다이어리 결과:"+re);
	}
	
	@Test
	public void  studyDiaryListTest(){
		List<StudyNoteVO> list=service.studyDiaryList(1);
		log.info(list);
	}
	
	@Test
	public void joinGroupListTest(){
		List<StudyGroupVO> list=service.joinGroupList(1);
		log.info(list);
	}
}
