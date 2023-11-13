package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;

import com.dao.PostDao;
import com.db.DBConnect;
import com.user.Post;

/**
 * Servlet implementation class AddnoteServlet
 */
@WebServlet("/AddnoteServlet")
public class AddnoteServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String content =request.getParameter("content");
	
		PostDao dao=new PostDao(DBConnect.getConn());
		 boolean f= dao.AddNotes(title, content, uid);
		 if(f) {
			 System.out.println("data insert successfully");
			 response.sendRedirect("showNotes.jsp");
		 }else {
			System.out.println("data not inserted");
		}
	}

}
