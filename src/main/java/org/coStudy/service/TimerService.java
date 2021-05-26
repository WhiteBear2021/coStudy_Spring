package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.TimerVO;

public interface TimerService {
	public int insert(TimerVO vo);
	public List<TimerVO> list(int user_no);
}
