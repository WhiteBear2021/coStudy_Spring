package org.coStudy.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.coStudy.domain.NoticeVO;



public interface NoticeMapper {
	List<NoticeVO> noticeInfo(RowBounds row);
	int noticeCreate(NoticeVO notice);
	int countNotice();
	NoticeVO noticeDetail(int notice_no);
	int noticeUpdate(NoticeVO notice);
	int noticeDelete(int notice_no);
}
