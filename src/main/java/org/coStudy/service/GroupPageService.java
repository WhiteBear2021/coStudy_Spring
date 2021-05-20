package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.GroupPageBoardVO;

public interface GroupPageService {
	int insertGroupBoard(GroupPageBoardVO board);
	List<GroupPageBoardVO> groupBoardList(int studyGroup_no);
	List<ApplyGroupMemberVO> selectApplyList(int studyGroup_no);
	int acceptMember(ApplyGroupMemberVO applyMember);
	int insertAcceptMember(ApplyGroupMemberVO insertMember);
	
	
	
}
