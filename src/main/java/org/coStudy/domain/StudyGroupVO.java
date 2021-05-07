package org.coStudy.domain;

public class StudyGroupVO {
	private int studygroup_no;
	private String studygroup_name;
	private String studygroup_info;
	private String studygroup_location;
	private int report_number;
	private int max_user_number;
	private int current_user_number;
	private String made_date;
	private String isdelete;
	private String isface;
	private int category_no;
	private int user_no;
	private String hashtag;
	public StudyGroupVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudyGroupVO(int studygroup_no, String studygroup_name, String studygroup_info, String studygroup_location,
			int report_number, int max_user_number, int current_user_number, String made_date, String isdelete,
			String isface, int category_no, int user_no, String hashtag) {
		super();
		this.studygroup_no = studygroup_no;
		this.studygroup_name = studygroup_name;
		this.studygroup_info = studygroup_info;
		this.studygroup_location = studygroup_location;
		this.report_number = report_number;
		this.max_user_number = max_user_number;
		this.current_user_number = current_user_number;
		this.made_date = made_date;
		this.isdelete = isdelete;
		this.isface = isface;
		this.category_no = category_no;
		this.user_no = user_no;
		this.hashtag = hashtag;
	}
	public int getStudygroup_no() {
		return studygroup_no;
	}
	public void setStudygroup_no(int studygroup_no) {
		this.studygroup_no = studygroup_no;
	}
	public String getStudygroup_name() {
		return studygroup_name;
	}
	public void setStudygroup_name(String studygroup_name) {
		this.studygroup_name = studygroup_name;
	}
	public String getStudygroup_info() {
		return studygroup_info;
	}
	public void setStudygroup_info(String studygroup_info) {
		this.studygroup_info = studygroup_info;
	}
	public String getStudygroup_location() {
		return studygroup_location;
	}
	public void setStudygroup_location(String studygroup_location) {
		this.studygroup_location = studygroup_location;
	}
	public int getReport_number() {
		return report_number;
	}
	public void setReport_number(int report_number) {
		this.report_number = report_number;
	}
	public int getMax_user_number() {
		return max_user_number;
	}
	public void setMax_user_number(int max_user_number) {
		this.max_user_number = max_user_number;
	}
	public int getCurrent_user_number() {
		return current_user_number;
	}
	public void setCurrent_user_number(int current_user_number) {
		this.current_user_number = current_user_number;
	}
	public String getMade_date() {
		return made_date;
	}
	public void setMade_date(String made_date) {
		this.made_date = made_date;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public String getIsface() {
		return isface;
	}
	public void setIsface(String isface) {
		this.isface = isface;
	}
	public int getcategory_no() {
		return category_no;
	}
	public void setcategory_no(int category_no) {
		this.category_no = category_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	@Override
	public String toString() {
		return "StudyGroupVO [studygroup_no=" + studygroup_no + ", studygroup_name=" + studygroup_name
				+ ", studygroup_info=" + studygroup_info + ", studygroup_location=" + studygroup_location
				+ ", report_number=" + report_number + ", max_user_number=" + max_user_number + ", current_user_number="
				+ current_user_number + ", made_date=" + made_date + ", isdelete=" + isdelete + ", isface=" + isface
				+ ", category_no=" + category_no + ", user_no=" + user_no + ", hashtag=" + hashtag + "]";
	}

	
}