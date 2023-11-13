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
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>
		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="AddnoteServlet" method="post">
						<div class="form-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">
							<%
							}
							%>



							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">

						</div>


						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="7" cols="" class="form-control" name="content"
								required="required"></textarea>
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