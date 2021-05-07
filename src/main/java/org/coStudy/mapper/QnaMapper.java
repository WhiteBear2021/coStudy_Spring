package org.coStudy.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.coStudy.domain.QnaVO;


public interface QnaMapper {
	List<QnaVO> QnaInfo(RowBounds row);
	List<QnaVO> QnaDetail(int qna_no);
	int QnaUserInsert(QnaVO qna);
	int QnaInsertManagerReply(QnaVO qna);
	int QnaInsertUserReply(QnaVO qna);
	int countQna();
}
