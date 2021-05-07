package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.GroupReplyVO;



public interface GroupReplyMapper {
	List<GroupReplyVO> listGroupReply();
	int insertGroupReply(GroupReplyVO groupReplyVO);
}
