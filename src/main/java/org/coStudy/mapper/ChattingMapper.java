package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.MessageVO;

public interface ChattingMapper {
	public int insert(MessageVO vo);//내 채팅이 그룹 채팅 테이블에 저장
	public List<MessageVO> list(int studygroup_no);//입장한 그룹의 채팅 내역을 가져옴, 이때 나의 채팅인지 아닌지 알 수 있어야함
	
}
