package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;

public interface ManagerMapper {
	int insert(ManagerVO manager);
	List<ManagerVO> list();
	int delete(int manager_no);
	ManagerVO managerLogin(LoginVO login);
}
