package org.Lecha.persistance;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTests {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/example?serverTimezone=Asia/Seoul";
	private static final String user = "root";
	private static final String pw = "1234";

	@Test
	public void testConnection() throws Exception {
		Class.forName(driver);
		try (Connection con = DriverManager.getConnection(url, user, pw)) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
