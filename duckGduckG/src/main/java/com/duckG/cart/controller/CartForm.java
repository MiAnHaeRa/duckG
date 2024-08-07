package com.duckG.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duckG.Control;
import com.duckG.cart.service.CartService;
import com.duckG.cart.service.CartServiceImpl;
import com.duckG.product.service.ProductService;
import com.duckG.product.service.ProductServiceImpl;
import com.duckG.vo.CartVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CartForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("logId");
		
		//장바구니에 추가할 때의 수량값 number

		try {
			if (id != null) {
				CartService cso = new CartServiceImpl();

				List<CartVO> cartTbody = cso.cartList(id);
				req.setAttribute("cartList", cartTbody);
				req.getRequestDispatcher("cart/cartForm.tiles").forward(req, resp);
			} else {
				req.getRequestDispatcher("member/loginForm.tiles").forward(req, resp);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter w = resp.getWriter();
			w.write("<script>alert('오류가 발생하였습니다.<br> 잠시후 다시 시도해 주십시오');</script>");
			w.flush();
			w.close();
			// resp.sendRedirect("main.do");
		}
	}

}
