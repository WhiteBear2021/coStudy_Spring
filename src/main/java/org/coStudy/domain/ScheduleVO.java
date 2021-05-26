package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class ScheduleVO implements Serializable{
	private int user_no;
	private int schedule_no;
	private String title;
	private boolean allday;
	private String schedule_start;
	private String schedule_end;
}
