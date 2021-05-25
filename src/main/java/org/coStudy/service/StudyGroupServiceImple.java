package org.coStudy.service;

import java.util.List;

import javax.inject.Inject;

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
   
}