package org.coStudy.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.Criteria;
import org.coStudy.domain.Search;
import org.coStudy.domain.StudyGroupVO;

public interface StudyGroupMapper { 
   public List<StudyGroupVO> list(Criteria cri);
   public void insert(StudyGroupVO studygroup);
   public StudyGroupVO detail(int studygroup_no);
   public int getTotalCount(Criteria cri);
   public void apply(ApplyGroupMemberVO ApplyGroup);
   
   public List<StudyGroupVO> managerList();
   public List<StudyGroupVO> listIT(int category_no);
   public List<StudyGroupVO> listF(int category_no);
   public List<StudyGroupVO> listE(int category_no);
   public List<StudyGroupVO> listC(int category_no);
   public List<StudyGroupVO> listM(int category_no);
}