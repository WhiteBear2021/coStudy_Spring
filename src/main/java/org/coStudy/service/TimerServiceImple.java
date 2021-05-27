package org.coStudy.service;

import java.util.List;

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

	@Override
	public List<TimerVO> list(int user_no) {
		List<TimerVO> list = mapper.list(user_no);
		
		for(int i=0;i<list.size(); i++){
			TimerVO vo = list.get(i);
			String time = vo.getTime().substring(0,vo.getTime().indexOf(":"));
			vo.setTime(time);
			String date = vo.getTimer_date().substring(0,vo.getTimer_date().indexOf(" "));
			vo.setTimer_date(date);
		}

		return list;
	}

}
