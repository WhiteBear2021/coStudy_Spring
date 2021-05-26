package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.ScheduleVO;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.StudyNoteVO;
import org.coStudy.domain.UserVO;
import org.coStudy.domain.toDoVO;

public interface MyPageService {
	 int updateUser(UserVO user);
	 int writeStudyDiary(StudyNoteVO studyNote);
	 int updateStudyDiary(StudyNoteVO diary);
	 int deleteStudyDiary(int studyNote_no);	
	 int totalStudyDiaryList(int user_no);
	 List<StudyNoteVO> studyDiaryList(int user_no);
	 List<StudyNoteVO> studyDiaryListWithPaging(Criteria cri);
	 List<StudyGroupVO> joinGroupList(int user_no);
	 StudyNoteVO studyDiaryDetail(int studyNote_no);
	 
	 int toDoInsert(toDoVO todo);
	 List<toDoVO> toDoList(int user_no);
	 
	 int scheduleRegister(ScheduleVO scheduel);
	 List<ScheduleVO> scheduleList(int user_no);

}
