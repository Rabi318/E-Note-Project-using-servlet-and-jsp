<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
UserDetails us2 = (UserDetails) session.getAttribute("userD");
if (us2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Login First");
}
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>


<div class="container-fluid  p-0" >
<%@include file="all_component/navbar.jsp" %>
<div class="card  mt-3">
<div class="card-body text-center">

<img alt="" src="img/note-taking2.jpg" class="img-fluid mx-auto" style="max-width: 300px">
<h1>START TAKING YOUR NOTES</h1>
<a href="addNote.jsp" class="btn btn-outline-primary">Start Here</a>

</div>

</div>

</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>