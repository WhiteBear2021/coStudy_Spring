package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.MessageVO;
import org.coStudy.mapper.ChattingMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ChattingServiceImple implements ChattingService{

	private ChattingMapper mapper;
	
	@Override
	public int insert(MessageVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public List<MessageVO> list(int studygroup_no) {
		return mapper.list(studygroup_no);
	}

}
