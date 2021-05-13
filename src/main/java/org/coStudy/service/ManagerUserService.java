package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.UserVO;

public interface ManagerUserService {

	List<UserVO> list();
	List<UserVO> newList(String dateString);
}
