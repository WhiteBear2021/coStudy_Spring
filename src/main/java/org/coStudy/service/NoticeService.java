package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> list(Criteria cri);
	
	public void insert(NoticeVO notice);
	public NoticeVO detail(int notice_no);
	public boolean delete(int notice_no);
	public boolean update(NoticeVO notice);
}
