package com.duckG.review.service;

import java.util.List;

import com.duckG.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> selectReview(int pno);
	List<ReviewVO> selectReviewPage(int pno, int page);
	boolean AddReview(ReviewVO rvo);
	
	//최근 리뷰 9건
	List<ReviewVO> lastestReview();
}
