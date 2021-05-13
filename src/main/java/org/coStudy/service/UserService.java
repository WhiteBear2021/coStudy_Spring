package org.coStudy.service;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.UserVO;

public interface UserService {
	int insertUser(UserVO user);
	UserVO login(LoginVO login);
	int idCheck(String user_id);
}
