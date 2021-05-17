package org.coStudy.service;

import java.util.HashMap;
import java.util.List;

import org.coStudy.domain.CategoryVO;
import org.coStudy.domain.LoginVO;
import org.coStudy.domain.UserVO;

public interface UserService {
	int insertUser(UserVO user);
	UserVO login(LoginVO login);
	int idCheck(String user_id);
	List<CategoryVO> categoryAllList();
	String searchId(HashMap<String, String> map);
}
