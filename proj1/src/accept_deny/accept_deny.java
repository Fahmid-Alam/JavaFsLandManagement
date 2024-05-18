package accept_deny;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBconnectionT;

/**
 * Servlet implementation class accept_deny
 */
@WebServlet("/accept_deny")
public class accept_deny extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public accept_deny() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status=request.getParameter("status");
		String sno=request.getParameter("sno");
		Date currentDate = new Date();
		String d=currentDate.toString();
		String from=request.getParameter("from");
		PrintWriter out=response.getWriter();
		out.println(status+" "+sno+" "+d+" "+from);
	   String email=request.getParameter("curr_user");
		
		 try {
	        	Connection con=DBconnectionT.takeConnection();
	        	String query = "Update legal set status='"+status+"', approval_date='"+d+"', approved_by='"+email+"' where sno='"+sno+"'";
	        	out.println(query);
				PreparedStatement ps = con.prepareStatement(query);
				ps.executeUpdate();
				
				
				
				if(from.equals("legal"))
				response.sendRedirect("legal.jsp");
				else if(from.equals("finance")) {
					response.sendRedirect("finance.jsp");
				}
				else if(from.equals("management")) {
					response.sendRedirect("management.jsp");
				}
				else
					response.sendRedirect("index.jsp");
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
		
		
	}

}
