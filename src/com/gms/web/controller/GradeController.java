package com.gms.web.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gms.web.util.DispatcherServlet;
import com.gms.web.util.Separetor;


@WebServlet("/grade.do")
public class GradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GradeController 진입");
		Separetor.init(request);
		switch (request.getParameter("action")) {
		case "move":
			DispatcherServlet.send(request,response);	
			break;

		default:
			break;
		}

	}

}