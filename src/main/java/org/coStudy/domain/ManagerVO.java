package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ManagerVO implements Serializable{
	private int manager_no;
	private String manager_id;
	private String manager_pw;
	
}
