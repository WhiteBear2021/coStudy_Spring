package org.coStudy.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.coStudy.domain.ApplyGroupMemberVO;
import org.coStudy.domain.Search;
import org.coStudy.domain.StudyGroupVO;



public interface StudyGroupMapper {
   /*int insertStudyGroup(StudyGroupVO studyGroup);
   StudyGroupVO studyGroupDetail(int studygroup_no);
   int countstudyGroupList();
   int insertApplyGroupStudy(ApplyGroupMemberVO applyGroupMember);
   List<StudyGroupVO> studyGroupListInfo();
   int getGroupNo(String studygroup_name);*/
   
   public List<StudyGroupVO> list(Search search);
   public void insert(StudyGroupVO studygroup);
   public StudyGroupVO detail(int studygroup_no);
}
