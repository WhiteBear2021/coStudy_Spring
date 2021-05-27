package org.coStudy.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GroupFileVO implements Serializable {
	int group_file_no;
	String group_file;
	String file_size;
	String file_title;
	int studygroup_no;
}
