<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management</title>
<%@ include file="cdn.jsp"%>
<%@ page import="java.sql.* , com.database.DBconnectionT"%>
<style>
        /* Style for the text area with name 'desc' */
        textarea[name="desc"] {
            width: 400px; /* Set the width to your desired value */
            height: 300px; /* Set the height if needed */
            resize: none; /* Disable resizing */
        }
</style>
</head>
<body>
<h1 class="text-center">Management</h1>
<div class="text-end mb-3">
            <form action="index.jsp" method="post">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
 <div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<fieldset>
				<legend> Request Form </legend>
				<form method="post" action="<%=request.getContextPath()%>/save_data">
				
					<input type="text" name="title" class="form-control" placeholder="Enter Request Title"/><br/>
					
					<textarea name="desc" class="form-control"  placeholder="Enter Request Description"/></textarea><br/>
					 
					 <%
					 String email=(String)(session.getAttribute("email"));
					 out.println("<input type='hidden' name='curr_user' value='"+email+"'/>");
					 %>
					
					<select name="dept" class="form-control">
	                <option value="legal">Legal</option>
	                <option value="finance">Finance</option>
            	</select><br/>
            	<input type="submit" class="btn btn-primary" value="Send Request"/>
				</form>
				
			</fieldset>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<hr>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<table class="table table-hover">
		<tr>
			<th>SNO</th>
			<th>Title</th>
			<th>Description</th>
			<th>Department</th>
			<th>Raised on</th>
						
			<th>Approval Date</th>
			<th>Approved By</th>
			<th>Status</th>
		</tr>
		<%
		try
		{
			Connection con = DBconnectionT.takeConnection();	
			String query = "select * from legal order by sno desc";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString("sno")+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				//out.println("<td>"+rs.getString(6)+"</td>");
				String approved_date=rs.getString(7);
				String approved_by=rs.getString(8);
				String status=rs.getString(9);
				out.println("<td>"+approved_date+"</td>");
				out.println("<td>"+approved_by+"</td>");
				out.println("<td>"+status+"</td>");
				out.println("</tr>");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		</table>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</body>
</html>