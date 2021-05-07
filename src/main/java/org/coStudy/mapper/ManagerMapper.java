package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;



public interface ManagerMapper {
	int insertManager(ManagerVO manager);
	List<ManagerVO> managerList();
	int deleteManager(int manager_no);
	ManagerVO managerLogin(LoginVO login);
}
