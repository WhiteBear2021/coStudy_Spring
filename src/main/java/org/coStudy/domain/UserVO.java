package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class UserVO implements Serializable{
	private int user_no;					
	private int category_no;				
	private String user_id;					
	private String user_pw;					
	private String user_lastName;			
	private String user_firstName;			
	private String user_phoneNo;			
	private String user_post;				
	private String user_address1;			
	private String user_address2;			
	private String user_birth;				
	private String user_email;				
	private String user_register_date;
	private String user_nickName;
	private String user_photo;
	private String user_thumbImg;
	
}
