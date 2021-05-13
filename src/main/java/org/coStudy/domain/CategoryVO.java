package org.coStudy.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class CategoryVO implements Serializable{
	private int category_no;
	private String category_name;
}
