package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.MessageVO;

public interface ChattingService {
	public int insert(MessageVO vo);
	public List<MessageVO> list(int studygroup_no);
}
