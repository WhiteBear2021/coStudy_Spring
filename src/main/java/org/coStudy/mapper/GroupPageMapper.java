package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.GroupReplyVO;



public interface GroupPageMapper {

	
	int insertGroupBoard(GroupPageBoardVO groupPageBoardVO);
	List<GroupPageBoardVO> groupBoardList(int studyGroup_no);
	List<ApplyGroupMemberVO> selectApplyList(int studyGroup_no);
	int acceptMember(ApplyGroupMemberVO vo);
	int insertAcceptMember(ApplyGroupMemberVO vo);
	int deleteRefuseMember(int user_no);
	
	List<GroupReplyVO> listGroupReply(int page_board_no);
	int insertGroupReply(GroupReplyVO groupReplyVO);
}


