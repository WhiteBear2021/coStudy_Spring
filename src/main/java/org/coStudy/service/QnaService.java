package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.QnaVO;

public interface QnaService {
	public int Userinsert(QnaVO qna);
	public List<QnaVO> UserList(int user_no);
}
