package org.coStudy.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.coStudy.domain.QnaVO;


public interface QnaMapper {
	int UserInsert(QnaVO qna);
	List<QnaVO> UserList(int user_no);
	List<QnaVO> UserDetail(QnaVO qna);
	int UserReplyInsert(QnaVO qna);
	
	List<QnaVO> ManagerList();
	List<QnaVO> ManagerDetail(int qna_no);
	int ManagerReplyInsert(QnaVO qna);
	
	List<Integer> charts();
	int charts2();
}
