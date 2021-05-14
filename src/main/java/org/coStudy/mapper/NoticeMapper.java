package org.coStudy.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.coStudy.domain.Criteria;
import org.coStudy.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> list(Criteria cri);
	
	public void insert(NoticeVO notice);
	public NoticeVO detail(int notice_no);
	public int delete(int notice_no);
	public int update(NoticeVO notice);
}
