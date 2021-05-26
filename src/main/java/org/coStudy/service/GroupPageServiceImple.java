package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.GroupFileVO;
import org.coStudy.domain.GroupPageBoardVO;
import org.coStudy.domain.GroupReplyVO;
import org.coStudy.mapper.GroupPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupPageServiceImple implements GroupPageService {

	@Autowired
	GroupPageMapper mapper;

	@Override
	public int insertGroupBoard(GroupPageBoardVO board) {
		return mapper.insertGroupBoard(board);
	}

	@Override
	public List<GroupPageBoardVO> groupBoardList(int studyGroup_no) {
		return mapper.groupBoardList(studyGroup_no);
	}

	@Override
	public List<ApplyGroupMemberVO> selectApplyList(int studyGroup_no) {
		return mapper.selectApplyList(studyGroup_no);
	}

	@Override
	public int acceptMember(ApplyGroupMemberVO applyMember) {
		return mapper.acceptMember(applyMember);
	}

	@Override
	public int insertAcceptMember(ApplyGroupMemberVO insertMember) {
		return mapper.acceptMember(insertMember);
	}

	@Override
	public List<GroupReplyVO> listGroupReply(int page_board_no) {
		// TODO Auto-generated method stub
		return mapper.listGroupReply(page_board_no);
	}

	@Override
	public int insertGroupReply(GroupReplyVO groupReplyVO) {
		return mapper.insertGroupReply(groupReplyVO);
	}

	@Override
	public int insertFile(GroupFileVO groupFile) {
		return mapper.insertFile(groupFile);
	}

	@Override
	public List<GroupFileVO> fileList(int studyGroup_no) {
		return mapper.fileList(studyGroup_no);
	}

}

