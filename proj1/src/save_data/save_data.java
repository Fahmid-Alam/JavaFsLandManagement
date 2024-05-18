package save_data;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBconnectionT;

/**
 * Servlet implementation class save_data
 */
@WebServlet("/save_data")
public class save_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public save_data() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title=request.getParameter("title");
		String desc=request.getParameter("desc");
		String dept=request.getParameter("dept");
		Date currentDate = new Date();
		String d=currentDate.toString();
		PrintWriter out=response.getWriter();
		String by=request.getParameter("curr_user");
		System.out.println(title+" "+desc+" "+dept+" "+d);
	    
		 try {
	        	Connection con=DBconnectionT.takeConnection();
	        	String query = "insert into legal (title,description,raised_by,raised_on,department) values"
	        			+ "('"+title+"','"+desc+ "','"+by+"','"+d+"','"+dept+"')";
	        	System.out.println(query);
				PreparedStatement ps = con.prepareStatement(query);
				ps.executeUpdate();
			    response.sendRedirect("management.jsp");
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
		
	}

}
