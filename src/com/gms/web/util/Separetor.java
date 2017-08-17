package com.gms.web.util;

import javax.servlet.http.HttpServletRequest;
import com.gms.web.command.Command;
import com.gms.web.factory.CommandFactory;

public class Separetor {
	public static Command cmd=new Command();
	public static void init(HttpServletRequest request){
		String action=request.getParameter("action");
		String page=request.getParameter("page");
		
		String servletPath=request.getServletPath();
		System.out.println("servletPath: "+servletPath);
		String directory = servletPath.substring(1,servletPath.indexOf("."));
		System.out.println("directory: "+directory);
		cmd=CommandFactory.createCommand(directory, action, page);
	}
}
