package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	static Connection conn;
	public static  Connection getConn() {
		try {
			
				
			if (conn==null) {
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","2000");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
			return conn;
	
	}
}
