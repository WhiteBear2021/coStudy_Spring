package org.coStudy.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.Criteria;
import org.coStudy.domain.Search;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.mapper.StudyGroupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StudyGroupServiceImple implements StudyGroupService{
	@Inject
	private StudyGroupMapper mapper;
	
	@Override
	public List<StudyGroupVO> list(Criteria cri) throws Exception {
		return mapper.list(cri);
	}
	
	@Override
	public void insert(StudyGroupVO studygroup) throws Exception {
		mapper.insert(studygroup);
	}
	
	@Override
	public StudyGroupVO detail(int studygroup_no) {
		return mapper.detail(studygroup_no);
	}

	@Override
	   public int getTotal(Criteria cri) {
	      return mapper.getTotalCount(cri);
	   }

	/*@Override
	public int countstudyGroupList() {
		return mapper.countstudyGroupList();
	}

	@Override
	public int insertApplyGroupStudy(ApplyGroupMemberVO applyGroupMember) {
		return mapper.insertApplyGroupStudy(applyGroupMember);
	}*/


	/*@Override
	public int getGroupNo(String studygroup_name) {
		return mapper.getGroupNo(studygroup_name);
	}*/

	
}
