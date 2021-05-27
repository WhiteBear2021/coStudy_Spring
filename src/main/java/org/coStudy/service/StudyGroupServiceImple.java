package org.coStudy.service;

import java.util.List;

import javax.inject.Inject;

import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.Criteria;
import org.coStudy.domain.StudyGroupVO;
import org.coStudy.mapper.StudyGroupMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StudyGroupServiceImple implements StudyGroupService{
   @Inject
   private StudyGroupMapper mapper;
   
   @Override
   public List<StudyGroupVO> list(Criteria cri) {
      return mapper.list(cri);
   }
   
   @Override
   public void insert(StudyGroupVO studygroup) {
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
   
   @Override
   public void apply(ApplyGroupMemberVO ApplyGroup){
      mapper.apply(ApplyGroup);
   }
   
	@Override
	public List<StudyGroupVO> managerList() {
		return mapper.managerList();
	}

	@Override
	public List<StudyGroupVO> listIT(int category_no) {
		return mapper.listIT(category_no);
	}

	@Override
	public List<StudyGroupVO> listF(int category_no) {
		return mapper.listF(category_no);
	}

	@Override
	public List<StudyGroupVO> listE(int category_no) {
		return mapper.listE(category_no);
	}

	@Override
	public List<StudyGroupVO> listC(int category_no) {
		return mapper.listC(category_no);
	}

	@Override
	public List<StudyGroupVO> listM(int category_no) {
		return mapper.listM(category_no);
	}

}