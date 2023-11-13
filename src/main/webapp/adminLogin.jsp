<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.div-custom {
	background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 100%);
	height: 83vh;
}
</style>

<meta charset="ISO-8859-1">
<title>Admin Login</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	

	<div class="container-fluid  div-custom">
		<div class="row  justify-content-center align-items-center">
			<div class="col-md-4-offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus" aria-hidden="true"></i>
						<h4>Admin Login</h4>
						
						
					</div>
					<%
					String invalidMsg=(String)session.getAttribute("login-failed");
					if(invalidMsg !=null){
						%>
						<div class="alert alert-danger" role="alert"><%=invalidMsg %></div>
						<%
					}
					session.removeAttribute("login-failed");
					%>


					<div class="card-body">
						<form action="loginservlet" method="post">


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="aemail"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="apassword">
							</div>

							<button type="submit" class="btn btn-primary">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>




</body>
</html>