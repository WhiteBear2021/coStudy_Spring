package org.coStudy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.coStudy.domain.StudyGroupVO;
import org.coStudy.mapper.MainPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
@Service
public class MainPageServiceImple implements MainPageService {
	@Setter(onMethod_ = @Autowired)
	MainPageMapper mapper;
	
	@Override
	public List<StudyGroupVO> getNew() {
		
		return mapper.getNew();
	}

	@Override
	public List<StudyGroupVO> getRandom() {
		Random rn = new Random();
		List<StudyGroupVO> list = mapper.list();
		List<StudyGroupVO> ranList = new ArrayList<StudyGroupVO>();
		int[] ranNum = new int[3];
		
		ranNum[0] = rn.nextInt(list.size());
		ranList.add(list.get(ranNum[0]));

		do{
			ranNum[1] = rn.nextInt(list.size());
		}while(ranNum[1] == ranNum[0]);
		ranList.add(list.get(ranNum[1]));
		
		do{
			ranNum[2] = rn.nextInt(list.size());
		}while(ranNum[2] == ranNum[1] || ranNum[2] == ranNum[0]);
		ranList.add(list.get(ranNum[2]));
		
		
		return ranList;
	}

	@Override
	public List<StudyGroupVO> getHot() {
		
		return mapper.getHot();
	}

	@Override
	public List<StudyGroupVO> getRecom(int category_no) {
		
		return mapper.getRecom(category_no);
	}

}
