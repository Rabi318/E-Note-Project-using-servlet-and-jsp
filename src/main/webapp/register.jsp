<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.div-custom {
	background: linear-gradient(to bottom, #003366 0%, #ff99cc 100%);
	height: 83vh;
}
</style>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid  div-custom">
		<div class="row  justify-content-center align-items-center">
			<div class="col-md-4-offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus" aria-hidden="true"></i>
						<h4>Register</h4>
					</div>



					<%
					String regMsg = (String) session.getAttribute("reg-sucess");
					if (regMsg != null) {
					%>

					<div class="alert alert-success" role="alert"><%=regMsg%> Login<a href="login.jsp">Click Here</a></div>

					<%
					session.removeAttribute("reg-sucess");
					}
					%>

					<%
					String failedMsg = (String) session.getAttribute("failed-msg");
					if (failedMsg != null) {
					%>

					<div class="alert alert-danger" role="alert"><%=failedMsg %></div>

					<%
					session.removeAttribute("failed-msg");
					}
					%>


					<div class="card-body">
						<form action="UserServlet" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" placeholder="Enter Name"
									name="fname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="uemail"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="upassword">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>