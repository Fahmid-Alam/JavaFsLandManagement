package com.database;

import java.sql.*;

public class DBconnectionT {
	
	public static Connection takeConnection() {
		Connection con=null;
		
        try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		  
		String path="jdbc:mysql://localhost:3306/proj1";
		String userName="root";
		String password="fahmid@1";
		
		con= DriverManager.getConnection(path, userName, password);
		
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
		
		return con;
	}

}
