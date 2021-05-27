package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.TimerVO;

public interface TimerMapper {
	public int insert(TimerVO vo);
	public List<TimerVO> list(int user_no);
}
