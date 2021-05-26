package org.coStudy.mapper;
import java.util.List;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.ScheduleVO;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.StudyNoteVO;
import org.coStudy.domain.UserVO;
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
public class MyPageMapperTests {
	@Setter(onMethod_=@Autowired)
	private  MyPageMapper mapper;
	
//	@Test
//	public void setup(){
//		log.info("mapper받아옴:"+mapper);
//	}
//	
//	@Test
//	public void updateUserTest(){
//		UserVO user=new UserVO(1, 1, "kosta211", "k1234", "수정하는 last name", "수정하는 first name", "010-0000-0000", "01234", "서울", "강의실", null, "WhiteBear2021@github.com", null);
//		int re=mapper.updateUser(user);
//		log.info("업데이트 결과:"+re);
//	}
//	
//	@Test
//	public void writeStudyDiaryTest(){
//		StudyNoteVO studyNote=new StudyNoteVO(0, "공부", "팀프로젝트 잘 할 수 있을까?", null, null, 1);
//		int re=mapper.writeStudyDiary(studyNote);
//		log.info("스터디 노트 작성 결과:"+re);
//	}
//	
//	@Test
//	public void studyDiaryList(){
//		List<StudyNoteVO> list=mapper.studyDiaryList(1);
//		log.info(list);
//		
//	}
//	
//	@Test
//	public void joinGroupListTests(){
//		List<StudyGroupVO> list=mapper.joinGroupList(1);
//		log.info(list);
//	}
//	//세부 목록 보기
//	@Test
//	public void studyDiaryDetail(){
//		StudyNoteVO diary=mapper.studyDiaryDetail(62);
//		log.info(diary);
//	}
//	
//	//여기서 부터 StudyNote paging을 위한 테스트
//	//페이징 테스트 1
//	@Test
//	public void pagingTest1(){
//		log.info("페이징 테스트1****************");
//		Criteria cri=new Criteria(); //기본 객체만 생성하면 자동으로 pageNum 1 amount 10으로 설정하도록 해 놓음
//		cri.setUser_no(1);
//		List<StudyNoteVO> list=mapper.studyDiaryListWithPaging(cri);
//		list.forEach(diary->log.info(diary));
//	}
//	
//	//페이징 테스트2
//	@Test
//	public void pagingTest2(){
//		log.info("페이징 테스트2****************");
//		Criteria cri=new Criteria(); 
//		cri.setPageNum(3);
//		cri.setAmount(5);
//		cri.setUser_no(1);
//		// 요청페이지번호가 3, 페이지당 글 갯수는 5로 지정하여 테스트
//		List<StudyNoteVO> list=mapper.studyDiaryListWithPaging(cri);
//		list.forEach(diary->log.info(diary));
//	}
//	
//	//페이징 테스트3 전체 글갯수 가져오는 쿼리문
//	@Test
//	public void pagingTest3(){
//		log.info("페이징 테스트3****************");
//		
//		int total=mapper.totalStudyDiaryList(1);
//		log.info("전체 글 갯수:"+total);
//	}
	
//	일정관리
//	@Test
//	public void scheduleListTest(){
//		log.info("스케쥴 목록 테스트");
//		
//		List<ScheduleVO> list=mapper.scheduleList(1);
//		log.info(list);
//	}
	
	//일정 등록
	@Test
	public void addSchedule(){
		log.info("일정 등록");
		
		ScheduleVO schedule=new ScheduleVO();
		schedule.setUser_no(1);
		schedule.setTitle("my event 연습");
		schedule.setSchedule_start("2021-05-12T00:00:00.000Z");
		schedule.setSchedule_end("2021-05-12T00:00:00.000Z");
		schedule.setAllday(true);
		
		int re=mapper.scheduleRegister(schedule);
		log.info("추가 결과:"+re);
	}
}
