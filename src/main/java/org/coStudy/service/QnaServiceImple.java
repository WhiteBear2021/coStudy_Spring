package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.QnaVO;
import org.coStudy.mapper.QnaMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class QnaServiceImple implements QnaService{
	private QnaMapper mapper;
	
	
	@Override
	public int Userinsert(QnaVO qna) {
		return mapper.UserInsert(qna);
		
	}

	@Override
	public List<QnaVO> UserList(int user_no) {
		return mapper.UserList(user_no);
	}

}
