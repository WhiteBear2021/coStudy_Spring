package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.StudyNoteVO;
import org.coStudy.domain.UserVO;
import org.springframework.web.bind.annotation.RequestParam;



public interface MyPageMapper {
	int updateUser(UserVO user);
	int writeStudyDiary(StudyNoteVO diary);
	int updateStudyDiary(StudyNoteVO diary);
	int deleteStudyDiary(int studyNote_no);	
	List<StudyNoteVO> studyDiaryList(int user_no);
	List<StudyGroupVO> joinGroupList(int user_no);
	StudyNoteVO studyDiaryDetail(int studyNote_no);
}
