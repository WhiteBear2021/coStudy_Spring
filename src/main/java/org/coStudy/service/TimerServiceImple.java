package org.coStudy.service;

import org.coStudy.domain.TimerVO;
import org.coStudy.mapper.TimerMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class TimerServiceImple implements TimerService {
	
	private TimerMapper mapper;
	
	@Override
	public int insert(TimerVO vo) {
		return mapper.insert(vo);
	}

}
