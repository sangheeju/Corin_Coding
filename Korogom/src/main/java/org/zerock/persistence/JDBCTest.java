package org.zerock.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	@Test
	public void testConnection() {
		Connection conn = null;
			try {

				String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
				String user = "root";
				String password = "12345";
				
				conn = DriverManager.getConnection(url, user, password);

				System.out.println(conn);

			}catch(Exception e) {
				e.printStackTrace();
			}
				
		}
	}
