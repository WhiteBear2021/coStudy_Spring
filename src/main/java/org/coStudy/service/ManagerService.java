package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;

public interface ManagerService {
	
	int insert(ManagerVO manager);
	List<ManagerVO> list();
	int delete(int manager_no);
	ManagerVO login(LoginVO login);
}
