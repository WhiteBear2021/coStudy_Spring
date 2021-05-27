package org.coStudy.mapper;

import java.util.HashMap;
import java.util.List;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.UserNewSta;
import org.coStudy.domain.UserVO;

public interface ManagerMapper {
	int insert(ManagerVO manager);
	List<ManagerVO> list();
	int delete(int manager_no);
	ManagerVO login(LoginVO login);
	
	//통계부분
	List<Integer> user_category_sta();
	List<Integer> studygroup_Category_Sta();
	List<UserNewSta> user_New_Sta();
	
	List<StudyGroupVO> studygroupList();
}
