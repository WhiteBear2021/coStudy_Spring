package org.coStudy.domain;

import java.util.Date;
import lombok.Data;

@Data
public class MessageVO{
	private String group_msg_log;
	private Date group_msg_date;
	private int group_msg_no;
	private int user_no;
	private int studygroup_no;
}
