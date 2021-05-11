package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.LoginVO;
import org.coStudy.domain.ManagerVO;
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
	public ManagerVO managerLogin(LoginVO login) {
		return mapper.managerLogin(login);
	}

}
