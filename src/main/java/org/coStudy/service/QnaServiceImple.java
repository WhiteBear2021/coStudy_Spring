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

	@Override
	public List<QnaVO> UserDetail(QnaVO qna) {
		
		return mapper.UserDetail(qna);
	}

	@Override
	public int UserReplyInsert(QnaVO qna) {
		return mapper.UserReplyInsert(qna);
	}

	@Override
	public List<QnaVO> ManagerList() {
		return mapper.ManagerList();
	}

	@Override
	public List<QnaVO> ManagerDetail(int qna_no) {
		return mapper.ManagerDetail(qna_no);
	}

	@Override
	public int ManagerReplyInsert(QnaVO qna) {
		return mapper.ManagerReplyInsert(qna);
	}

	@Override
	public List<Integer> charts() {
		
		return mapper.charts();
	}

	@Override
	public int charts2() {
		
		return mapper.charts2();
	}

}
