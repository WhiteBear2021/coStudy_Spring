package org.coStudy.domain;

import java.io.Serializable;

public class UserVO implements Serializable{
	private int user_no;					//�쉶�썝踰덊샇
	private int category_no;				//移댄뀒怨좊━踰덊샇
	private String user_id;					//�쉶�썝�븘�씠�뵒
	private String user_pw;					//�쉶�썝鍮꾨�踰덊샇
	private String user_lastName;			//�쉶�썝 �꽦
	private String user_firstName;			//�쉶�썝 �씠由�
	private String user_phoneNo;			//�쉶�썝 �쟾�솕踰덊샇
	private String user_post;				//�슦�렪踰덊샇
	private String user_address1;			//�쉶�썝 二쇱냼2
	private String user_address2;			//�쉶�썝 二쇱냼3
	private String user_birth;				//�쉶�썝 �깮�뀈�썡�씪
	private String user_email;				//�쉶�썝 �씠硫붿씪
	private String user_register_date;		//�쉶�썝 �벑濡앹씪
	public UserVO() {
		super();
	}
	public UserVO(int user_no, int category_no, String user_id, String user_pw, String user_lastName,
			String user_firstName, String user_phoneNo, String user_post, String user_address1, String user_address2,
			String user_birth, String user_email, String user_register_date) {
		super();
		this.user_no = user_no;
		this.category_no = category_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_lastName = user_lastName;
		this.user_firstName = user_firstName;
		this.user_phoneNo = user_phoneNo;
		this.user_post = user_post;
		this.user_address1 = user_address1;
		this.user_address2 = user_address2;
		this.user_birth = user_birth;
		this.user_email = user_email;
		this.user_register_date = user_register_date;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_lastName() {
		return user_lastName;
	}
	public void setUser_lastName(String user_lastName) {
		this.user_lastName = user_lastName;
	}
	public String getUser_firstName() {
		return user_firstName;
	}
	public void setUser_firstName(String user_firstName) {
		this.user_firstName = user_firstName;
	}
	public String getUser_phoneNo() {
		return user_phoneNo;
	}
	public void setUser_phoneNo(String user_phoneNo) {
		this.user_phoneNo = user_phoneNo;
	}
	public String getUser_post() {
		return user_post;
	}
	public void setUser_post(String user_post) {
		this.user_post = user_post;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_register_date() {
		return user_register_date;
	}
	public void setUser_register_date(String user_register_date) {
		this.user_register_date = user_register_date;
	}
	@Override
	public String toString() {
		return "UserVO [user_no=" + user_no + ", category_no=" + category_no + ", user_id=" + user_id + ", user_pw="
				+ user_pw + ", user_lastName=" + user_lastName + ", user_firstName=" + user_firstName
				+ ", user_phoneNo=" + user_phoneNo + ", user_post=" + user_post + ", user_address1=" + user_address1
				+ ", user_address2=" + user_address2 + ", user_birth=" + user_birth + ", user_email=" + user_email
				+ ", user_register_date=" + user_register_date + "]";
	}
	
	
}
