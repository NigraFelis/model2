package com.gms.web.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.constant.Action;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.service.MemberService;
import com.gms.web.service.MemberServiceImpl;
import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.ParamsIterator;
import com.gms.web.util.Separetor;

@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController 진입");
		Separetor.init(request);
		MemberBean member=new MemberBean();
		MajorBean major =null;
		MemberService service= MemberServiceImpl.getInstance();
		
		switch (request.getParameter("action")) {
		case "move":
			DispatcherServlet.send(request,response);	
			break;
		case "join":
			System.out.println("=== JOIN진입 ===");
			Map<?,?> map=ParamsIterator.execute(request);
			member.setId((String)map.get("userId"));
			member.setPassword((String)map.get("userPw"));
			member.setName((String)map.get("name"));
			
			member.setEmail((String)map.get("email"));
			member.setPhone((String)map.get("phone"));
			member.setMajor((String)map.get("major"));
			
			// major는 여러 행을 입력해야함
			String[] subjects=((String)map.get("subject")).split(",");
			
			List<MajorBean> list = new ArrayList<>();
			for(int i=0;i<subjects.length;i++){
				major=new MajorBean();
				major.setMajorId(String.valueOf((int)((Math.random()*9999 + 1000))));
				major.setId((String)map.get("userId"));
				major.setTitle((String)map.get("name"));
				major.setSubjId(subjects[i]);
				list.add(major);
			}
			
			Map<String, Object>tempMap= new HashMap<>();
			tempMap.put("member", member);
			tempMap.put("major",list);
			String rs = service.addMember(tempMap);
			Separetor.cmd.setDirectory("common");
			Separetor.cmd.process();
			System.out.println("컨트롤러 인서트 결과 id"+rs);
			
			DispatcherServlet.send(request,response);
			break;
			
		case Action.LIST:
			System.out.println("Member List ENTER");
			@SuppressWarnings("unchecked")
			List<StudentBean> memberList=(List<StudentBean>)service.list();
			System.out.println("DB에서 가저온 MemberList" +memberList);
			request.setAttribute("list", memberList);
			DispatcherServlet.send(request,response);
			break;
		default:
			System.out.println("FAIL");
			break;
		}

	}

}
