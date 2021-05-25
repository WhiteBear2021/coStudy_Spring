package org.coStudy.service;

import java.util.List;

import org.coStudy.domain.StudyGroupVO;

public interface MainPageService {
	public List<StudyGroupVO> getNew();
	public List<StudyGroupVO> getRandom();
	public List<StudyGroupVO> getHot();
	public List<StudyGroupVO> getRecom(int category_no);
}
