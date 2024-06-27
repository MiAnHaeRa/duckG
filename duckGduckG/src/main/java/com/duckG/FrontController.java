package com.duckG;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.duckG.main.MainControl;
import com.duckG.member.controller.LoginForm;
import com.duckG.member.controller.MyPage;
import com.duckG.member.controller.Mymemberpage;
import com.duckG.product.web.productForm;

// front -> 요청url(*.do) - 실행컨트롤 매칭
// main.do -> FrontController -> /WEB-INF/public/main.jsp
// 객체생성 -> init -> service -> destroy
public class FrontController extends HttpServlet {
	
	private Map<String, Control> map;	//key : url, value : control
	
	public FrontController() {
		map = new HashMap<String, Control>();
	}
	
	@Override
	public void init() throws ServletException {
		//홈페이지
		map.put("/main.do", new MainControl());
		
		//로그인
		map.put("/loginForm.do", new LoginForm());
		
		//제품별상세페이지
		map.put("/productForm.do", new productForm());
		
		//마이페이지
		map.put("/MyPage.do", new MyPage());
		map.put("/Mymemberpage.do", new Mymemberpage());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String page = uri.substring(context.length());
		Control result = map.get(page);
		result.exec(req, resp);
	}
}
