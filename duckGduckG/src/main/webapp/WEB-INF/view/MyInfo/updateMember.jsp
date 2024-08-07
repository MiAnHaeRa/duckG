<%@page import="com.duckG.member.service.MemberService"%>
<%@page import="com.duckG.member.service.MemberServiceImpl"%>
<%@page import="com.duckG.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String loginId = (String) session.getAttribute("logId");
MemberVO mvo = (MemberVO)request.getAttribute("mvo");
%>

<!-- <section class="breadcrumb-section set-bg"
	data-setbg="img/breadcrumb.jpg" style="width: 100%">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>내 정보</h2>
				</div>
			</div>
		</div>
	</div>
</section> -->
<!-- Checkout Section Begin -->
<section class="update" style="padding-top: 100px;">
	<div class="container">
		<form action="updateMemberFin.do" method = "post">
			<div class="row">
				<div class="col-lg-4">
					<div class="blog__sidebar__item">
					<h3>내 페이지</h3>
					<br/>
						<ul>
							<li><h4>나의 현황</h4></li>
							<li><a href="MyInfo.do">주문 내역</a></li>
							<li><hr></li>
							<li><h4>개인 정보</h4></li>
							<li><a href="updateMember.do">개인 정보 수정</a></li>
							<li><a href="ChangePw.do">비밀 번호 수정</a></li>
							<li><a href="deleteMember.do">회원 탈퇴</a></li>
							<li><hr></li>
						</ul>
					</div>
				</div>


				<div class="col-md-6" id="row2">
						<h4>개인 정보 수정</h4>
					<div class="row" style="padding-top: 50px;">
						<div class="col-lg-6">
							<div class="checkout__input">
								<p>ID</p>
								<input name="id" type="text" value="<%=loginId%>" readonly>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="checkout__input">
								<p>
									이름<span>*</span>
								</p>
								<input type="text" name="name" value="<%=mvo.getMemberName()%>" >
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="checkout__input">
								<p>
									휴대폰<span>*</span>
								</p>
								<input type="text" name="Phone" value="${ mvo.phone = mvo.phone == null ? '' : mvo.phone}"> 
							</div>
						</div>
						<div class="col-lg-6">
							<div class="checkout__input">
								<p>
									E-mail<span>*</span>
								</p>
								<input type="text" name="Email" value="${mvo.email = mvo.email == null ? '' : mvo.email }">
							</div>
						</div>
					</div>
					<div class="checkout__input">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						<br>
						<p>
							우편 번호<span>*</span>
						</p>
						<input type="text" name="addrno" id="sample4_postcode" placeholder="우편 번호" value="${mvo.addrNo = mvo.addrNo == null ? '' : mvo.addrNo }">
					</div>
					<div class="checkout__input">
						<p>
							도로명 주소<span>*</span>
						</p>
						<input type="text" name="addroad" id="sample4_roadAddress" placeholder="도로명 주소" class="checkout_input__add" value="${mvo.addrRoad = mvo.addrRoad == null ? '' : mvo.addrRoad}">
					</div>
					<div class="checkout__input">
						<p>
							지번 주소<span>*</span>
						</p>
						<input type="text" name="addrlocal" id="sample4_jibunAddress" placeholder="지번 주소" value="${mvo.addrLocal = mvo.addrLocal == null ? '' : mvo.addrLocal }">
					</div>
					<div>
						<span id="guide" style="color:#999;display:none"></span>
					</div>
					<div class="checkout__input">
						<p>
							상세 주소<span>*</span>
						</p>
						<input type="text" name="addrdet" id="sample4_detailAddress" placeholder="상세 주소" value="${mvo.addrDet = mvo.addrDet == null ? '' : mvo.addrDet }">
					</div>
					<div style="text-align: center;">
						<button type="submit" class="site-btn">수정</button>
						<button type="reset" class="site-btn"
							onclick="location.href='MyInfo.do'">취소</button>
					</div>
				</div>
			</div>

		</form>

	</div>
</section>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/myinfo/updateMember.js"></script>
