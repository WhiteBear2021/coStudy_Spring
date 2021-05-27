package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.Criteria;
import org.coStudy.domain.StudyGroupVO;

public interface StudyGroupService {    
      public List<StudyGroupVO> list(Criteria cri);
      public void insert(StudyGroupVO studygroup);
      public StudyGroupVO detail(int studygroup_no);
      public int getTotal(Criteria cri);
      
      public List<StudyGroupVO> managerList();

}