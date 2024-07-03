package com.duckG.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private int productNo;
	private String memberId;
	private String reviewContent;
	private int reviewScore;
	private String reviewImage;
	private String createDate;	
}
