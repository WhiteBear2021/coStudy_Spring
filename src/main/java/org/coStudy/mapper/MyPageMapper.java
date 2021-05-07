package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.StudyNoteVO;
import org.coStudy.domain.UserVO;



public interface MyPageMapper {
	int updateUser(UserVO user);
	int writeStudyDiary(StudyNoteVO diary);
	List<StudyNoteVO> studyDiaryList(int user_no);
	List<StudyGroupVO> joinGroupList(int user_no);
}
