package com.gms.web.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gms.web.constant.Action;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
import com.gms.web.service.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separetor;


@WebServlet("/common.do")
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		System.out.println("CommandController");
		Separetor.init(request);

		switch (request.getParameter(Action.CMD)) {
		case Action.MOVE:
			DispatcherServlet.send(request,response);		
			break;
		case Action.LOGIN:
			MemberService service = MemberServiceImpl.getInstance();
			MemberBean m = new MemberBean();
			m.setId(request.getParameter("input_id"));
			m.setPassword(request.getParameter("input_pass"));
			
			Map<String,Object> map=service.login(m);
			System.out.println(map.get("page"));
			
			if(map.get("page").equals("main")){
				session.setAttribute("user", map.get("user"));
			}
	
			Separetor.cmd.setPage(String.valueOf(map.get("page")));
			Separetor.cmd.process();
			DispatcherServlet.send(request,response);
			break;
		case Action.LOGOUT:
			session.invalidate();
			DispatcherServlet.send(request,response);
			break;
			
			default:
				break; 
			
			
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
