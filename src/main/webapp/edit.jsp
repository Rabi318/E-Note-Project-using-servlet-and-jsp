<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.user.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails us1 = (UserDetails) session.getAttribute("userD");
if (us1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Login First");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id "));
	
	PostDao post=new PostDao(DBConnect.getConn());
	    Post p=  post.getDataById(noteid);
	%>

	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>
		<h1 class="text-center">Edit Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="NoteEditServlet" method="post">
						<input type="hidden" value="<%=noteid%>" name="noteid">
						<div class="form-group">


							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle()%>">

						</div>


						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="7" cols="" class="form-control" name="content"
								required="required"><%=p.getContent() %></textarea>
						</div>
						<div class="container text-center">

							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>

				</div>


			</div>
		</div>

	</div>




</body>
</html>