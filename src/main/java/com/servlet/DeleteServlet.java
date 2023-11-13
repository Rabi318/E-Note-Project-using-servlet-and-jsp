package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDao;
import com.db.DBConnect;
import com.mysql.cj.Session;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Integer noteid=Integer.parseInt(request.getParameter("note_id"));
		PostDao post=new PostDao(DBConnect.getConn());
		boolean f= post.DeleteNotes(noteid);
		HttpSession session=null;
		if(f) {
			 session =request.getSession();
			session.setAttribute("DeleteMsg", "Note Delete Successfully");
			response.sendRedirect("showNotes.jsp");
		}else {
			session=request.getSession();
			session.setAttribute("WrongMsg", "Something went wrong on server");
			response.sendRedirect("showNotes.jsp");
		}
	}

	

}
