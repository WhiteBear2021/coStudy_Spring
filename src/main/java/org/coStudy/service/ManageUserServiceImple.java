package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.UserVO;
import org.coStudy.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManageUserServiceImple implements ManagerUserService{

	@Autowired
	UserMapper mapper;
	
	@Override
	public List<UserVO> list() {
		return mapper.userInfo();
	}

	@Override
	public List<UserVO> newList(String dateString) {
		return mapper.newUserInfo(dateString);
	}

}
