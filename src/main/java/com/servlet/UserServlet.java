package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.user.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("fname");
		String email=req.getParameter("uemail");
		String password=req.getParameter("upassword");
		
		
		UserDetails userDetails=new UserDetails();
		userDetails.setName(name);
		userDetails.setEmail(email);
		userDetails.setPassword(password);
		
		UserDao userDao=new UserDao(DBConnect.getConn());
	    boolean f=	userDao.addUser(userDetails);
	    
	    HttpSession session;
	    
	    if(f) {
	    	session=req.getSession();
	    	session.setAttribute("reg-sucess", "Registration Successfully");
	    	resp.sendRedirect("register.jsp");
	    	
	    }else {
			session=req.getSession();
			session.setAttribute("failed-msg", "Something went on server");
			resp.sendRedirect("register.jsp");
		}
	}


	
}
