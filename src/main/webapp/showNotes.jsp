<%@page import="com.user.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails us3 = (UserDetails) session.getAttribute("userD");
if (us3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", " Please Login ");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Note page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>


	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
<div class="alert alert-success" role="alert"><%=updateMsg %></div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	
	<%
	String DeleteMsg = (String) session.getAttribute("DeleteMsg");
	if (DeleteMsg != null) {
	%>
<div class="alert alert-success" role="alert"><%=DeleteMsg %></div>
	<%
	session.removeAttribute("DeleteMsg");
	}
	%>
	
	<div class="container">
		<h2 class="text-center">All Notes</h2>

		<div class="row">
			<div class="col-md-12">

				<%
				if (us3 != null) {
					PostDao ob = new PostDao(DBConnect.getConn());
					List<Post> post = ob.getData(us3.getId());
					for (Post po : post) {
				%>


				<div class="card mt-3">
					<img alt="" src="img/note-taking.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px">
					<div class="card-body p-4">




						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>
						<p>
							<b class="text-success">Published By:<%=us3.getName()%>
							</b></br> <b class="text-primary"> </b>
						</p>
						<p>
							<b class="text-success">Published Date:<%=po.getDate()%>
							</b></br> <b class="text-success"> </b>
						</p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%= po.getId() %>" class="btn btn-danger">Delete</a>
							<a href="edit.jsp?note_id =<%=po.getId()%>"
								class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>

			</div>

		</div>
	</div>

</body>
</html>