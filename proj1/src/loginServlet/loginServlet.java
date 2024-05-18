package loginServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DBconnectionT;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        HttpSession session = request.getSession( );
        session.setAttribute("email", email);
        
        try {
        	Connection con=DBconnectionT.takeConnection();
        	String query = "select * from login where email='"+email+"' and password='"+password+"' and role='"+role+"'";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			PrintWriter out=response.getWriter();
			
			if(rs.next()) {   // koi to h with this data 
				if(role.equals("legal")) {
                    out.println("<h1>Legal</h1>");
					response.sendRedirect("legal.jsp");
				}
				else if(role.equals("finance")) {
					 out.println("<h1>Finance</h1>");
					response.sendRedirect("finance.jsp");
				}
				else {
					 out.println("<h1>Mgmt</h1>");
					response.sendRedirect("management.jsp");
				}
			}
			else {   // no one with data
				 out.println("<h1>Fail</h1>");
				response.sendRedirect("index.jsp");
			}
              
        } catch(Exception e) {
            e.printStackTrace();
        }
        
		
	}

}
