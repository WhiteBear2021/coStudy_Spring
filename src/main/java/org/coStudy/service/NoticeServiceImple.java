package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.NoticeVO;
import org.coStudy.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class NoticeServiceImple implements NoticeService{
	
	private NoticeMapper mapper;
	
	@Override
	public void insert(NoticeVO notice) {
		mapper.insert(notice);
	}


	@Override
	public NoticeVO detail(int notice_no) {
		return mapper.detail(notice_no);
	}

	@Override
	public boolean delete(int notice_no) {
		return mapper.delete(notice_no)==1;
	}

	@Override
	public boolean update(NoticeVO notice) {
		return mapper.update(notice)==1;
	}

	@Override
	public List<NoticeVO> list(Criteria cri) {
		
		return mapper.list(cri);
	}

}
