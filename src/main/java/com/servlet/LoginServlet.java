package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.user.UserDetails;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String emailString=req.getParameter("uemail");
		String passwordString=req.getParameter("upassword");
		
		UserDetails userDetails=new UserDetails();
		userDetails.setEmail(emailString);
		userDetails.setPassword(passwordString);
		
		UserDao da0=new UserDao(DBConnect.getConn());
		   UserDetails user= da0.logingUser(userDetails);
		if(user !=null) {
			HttpSession session=req.getSession();
			session.setAttribute("userD", user);
			
			resp.sendRedirect("home.jsp");
		}else {
			HttpSession session=req.getSession();
			session.setAttribute("login-failed", "Invalid  User Email and Password");
			resp.sendRedirect("login.jsp");
		}
	}

}
