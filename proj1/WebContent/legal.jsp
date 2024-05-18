<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Legal</title>
<%@ include file="cdn.jsp" %>
<%@ page import="java.sql.* , com.database.DBconnectionT"%>
</head>
<body>
<h1 class="text-center"> Legal Page </h1>
<div class="text-end mb-3">
            <form action="index.jsp" method="post">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<table class="table table-hover">
		<tr>
			<th>SNO</th>
			<th>Title</th>
			<th>Description</th>
			<th>Raised By</th>
			<th>Raised on</th>
			
			<th>Approval Date</th>
			<th>Approved By</th>
			<th>Status</th>
		</tr>
		<%
		try
		{
			String email=(String)(session.getAttribute("email"));
			Connection con = DBconnectionT.takeConnection();	
			String query = "select * from legal where department='legal' order by sno desc";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getInt(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				//out.println("<td>"+rs.getString(6)+"</td>");
				String approved_date=rs.getString(7);
				String approved_by=rs.getString(8);
				String status=rs.getString(9);
				out.println("<td>"+approved_date+"</td>");
				out.println("<td>"+approved_by+"</td>");
				
				if(!status.equals("pending")){
				out.println("<td>"+status+"</td>");
				}else{
					String contextPath = request.getContextPath();
                    out.println("<td>");
                    out.println("<form action='" + contextPath + "/accept_deny' method='post'>");
                    out.println("<input type='hidden' name='sno' value='" + rs.getString(1) + "' />");
                    out.println("<input type='hidden' name='from' value='legal' />");
                    out.println("<input type='hidden' name='curr_user' value='"+email+"'/>");
                    out.println("<input type='submit' name='status' value='accept' />");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("<td>");
                    out.println("<form action='" + contextPath + "/accept_deny' method='post'>");
                    out.println("<input type='hidden' name='sno' value='" + rs.getString(1) + "' />");
                    out.println("<input type='hidden' name='from' value='legal' />");
                    out.println("<input type='hidden' name='curr_user' value='"+email+"'/>");
                    out.println("<input type='submit' name='status' value='deny' />");
                    out.println("</form>");
                    out.println("</td>");
				}
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