package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.GroupFileVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.GroupReplyVO;
import org.coStudy.domain.GroupUserVO;
import org.coStudy.domain.UserVO;



public interface GroupPageMapper {

	
	int insertGroupBoard(GroupPageBoardVO groupPageBoardVO);
	List<GroupPageBoardVO> groupBoardList(int studygroup_no);
	
	List<ApplyGroupMemberVO> selectApplyList(int studygroup_no);
	int acceptMember(ApplyGroupMemberVO applyMember);
	int insertAcceptMember(ApplyGroupMemberVO insertMember);
	int deleteRefuseMember(int user_no);
	
	// 댓글
	List<GroupReplyVO> listGroupReply();
	int insertGroupReply(GroupReplyVO groupReplyVO);
	int insertFile(GroupFileVO groupFile);
	List<GroupFileVO> fileList(int studygroup_no);
	List<UserVO> groupUserList(int studygroup_no);
}


