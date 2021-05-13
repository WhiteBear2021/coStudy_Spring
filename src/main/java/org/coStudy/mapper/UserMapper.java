package org.coStudy.mapper;
import java.util.List;

import org.coStudy.domain.CategoryVO;
import org.coStudy.domain.LoginVO;
import org.coStudy.domain.UserVO;



public interface UserMapper {
	UserVO selectUser();
	int insertUser(UserVO user);
	List<UserVO> userInfo();
	List<UserVO> newUserInfo(String dateString);
	UserVO login(LoginVO login);
	int idCheck(String user_id);
	List<CategoryVO> categoryAllList();
}
