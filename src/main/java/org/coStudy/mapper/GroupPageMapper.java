package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.GroupReplyVO;
import org.coStudy.domain.GroupUserVO;
import org.coStudy.domain.UserVO;



public interface GroupPageMapper {

	
	int insertGroupBoard(GroupPageBoardVO groupPageBoardVO);
	List<GroupPageBoardVO> groupBoardList(int studyGroup_no);
	
	List<ApplyGroupMemberVO> selectApplyList(int studyGroup_no);
	int acceptMember(ApplyGroupMemberVO vo);
	int insertAcceptMember(ApplyGroupMemberVO vo);
	int deleteRefuseMember(int user_no);
	
	// 댓글
	List<GroupReplyVO> listGroupReply();
	int insertGroupReply(GroupReplyVO groupReplyVO);
	
	List<UserVO> groupUserList(int studygroup_no);
}


