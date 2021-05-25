package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.QnaVO;

public interface QnaService {
	public int Userinsert(QnaVO qna);
	public List<QnaVO> UserList(int user_no);
	public List<QnaVO> UserDetail(QnaVO qna);
	public int UserReplyInsert(QnaVO qna);
	
	public List<QnaVO> ManagerList();
	public List<QnaVO> ManagerDetail(int qna_no);
	public int ManagerReplyInsert(QnaVO qna);
	
	public List<Integer> charts();
	public int charts2();
	
	
}
