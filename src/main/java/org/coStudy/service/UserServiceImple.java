package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.CategoryVO;
import org.coStudy.domain.LoginVO;
import org.coStudy.domain.UserVO;
import org.coStudy.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImple implements UserService{
	@Autowired
	UserMapper mapper;
	
	public int insertUser(UserVO user){
		
		return mapper.insertUser(user);
	}

	public UserVO login(LoginVO login){
	
		return mapper.login(login);
	}

	@Override
	public int idCheck(String user_id) {
		// TODO Auto-generated method stub
		return mapper.idCheck(user_id);
	}

	@Override
	public List<CategoryVO> categoryAllList() {
		// TODO Auto-generated method stub
		return mapper.categoryAllList();
	}
}
