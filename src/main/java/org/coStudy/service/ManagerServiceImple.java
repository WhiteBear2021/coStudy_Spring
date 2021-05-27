package org.coStudy.service;

import java.util.HashMap;
import java.util.List;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.domain.UserNewSta;
import org.coStudy.domain.UserVO;
import org.coStudy.mapper.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImple implements ManagerService{

	@Autowired
	ManagerMapper mapper;
	@Override
	public int insert(ManagerVO manager) {
		return mapper.insert(manager);
	}

	@Override
	public List<ManagerVO> list() {
		return mapper.list();
	}

	@Override
	public int delete(int manager_no) {
		return mapper.delete(manager_no);
	}

	@Override
	public ManagerVO login(LoginVO login) {
		return mapper.login(login);
	}

	@Override
	public List<Integer> user_category_sta() {
		return mapper.user_category_sta();
	}

	@Override
	public List<Integer> studygroup_Category_Sta() {
		return mapper.studygroup_Category_Sta();
	}

	@Override
	public List<UserNewSta> user_New_Sta() {
		return mapper.user_New_Sta();
	}





}
