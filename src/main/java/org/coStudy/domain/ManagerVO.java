package org.coStudy.domain;

import java.io.Serializable;

public class ManagerVO implements Serializable{
	private int manager_no;
	private String manager_id;
	private String manager_pw;

	public ManagerVO() {
	}

	public int getManager_no() {
		return manager_no;
	}

	public void setManager_no(int manager_no) {
		this.manager_no = manager_no;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_pw() {
		return manager_pw;
	}

	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}

	public ManagerVO(int manager_no, String manager_id, String manager_pw) {
		super();
		this.manager_no = manager_no;
		this.manager_id = manager_id;
		this.manager_pw = manager_pw;
	}
	
	@Override
	public String toString() {
		return "ManagerVO [manager_no=" + manager_no + ", manager_id=" + manager_id + ", manager_pw=" + manager_pw
				+ "]";
	}
	
}
