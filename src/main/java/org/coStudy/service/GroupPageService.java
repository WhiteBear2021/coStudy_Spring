package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.GroupFileVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.GroupReplyVO;
import org.coStudy.domain.UserVO;

public interface GroupPageService {

	int insertGroupBoard(GroupPageBoardVO board);
	List<GroupPageBoardVO> groupBoardList(int studygroup_no);
	List<ApplyGroupMemberVO> selectApplyList(int studygroup_no);
	int acceptMember(ApplyGroupMemberVO applyMember);
	int insertAcceptMember(ApplyGroupMemberVO insertMember);
	
	List<GroupReplyVO> listGroupReply();
	int insertGroupReply(GroupReplyVO groupReplyVO);

	int insertFile(GroupFileVO groupFile);
	List<GroupFileVO> fileList(int studygroup_no);
	List<UserVO> groupUserList(int studygroup_no);

}
