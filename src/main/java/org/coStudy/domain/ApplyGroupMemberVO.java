package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ApplyGroupMemberVO implements Serializable{
	private char isAccept;
	private int user_no;
	private int studygroup_no;
	
}
