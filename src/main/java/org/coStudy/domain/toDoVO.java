package org.coStudy.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class toDoVO implements Serializable{
	private int user_no;
	private String todo_content;
	private Date todo_date;
	private int complete;
	private int todo_no;
}
