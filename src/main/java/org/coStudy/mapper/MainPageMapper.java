package org.coStudy.mapper;

import java.util.List;

import org.coStudy.domain.StudyGroupVO;

public interface MainPageMapper {
	public List<StudyGroupVO> getNew();
	public List<StudyGroupVO> getHot();
	public List<StudyGroupVO> getRecom(int category_no);
	public  List<StudyGroupVO> list();
	
}
