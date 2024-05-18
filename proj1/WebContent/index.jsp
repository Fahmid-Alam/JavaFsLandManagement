<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<%@ include file="cdn.jsp"%>
</head>
<body>
 <div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<fieldset>
				<legend> Login </legend>
				<form method="post" action="<%=request.getContextPath()%>/loginServlet">
				
					<input type="text" name="email" class="form-control" placeholder="Enter Email"/><br/>
					
					<input type="text" name="password" class="form-control" placeholder="Enter Password"/><br/>
					
					
					<select name="role" class="form-control">
	                <option value="legal">Legal</option>
	                <option value="finance">Finance</option>
	                <option value="management">Management</option>
            	</select><br/>
            	<input type="submit" class="btn btn-primary" value="Login"/>
				</form>
				
			</fieldset>
		</div>
		<div class="col-md-4"></div>
	</div>
</body>
</html>