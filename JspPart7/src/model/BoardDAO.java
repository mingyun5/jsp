package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 글쓰기
	public void insertBoard(BoardBean bean) {
		getCon();

		int ref = 0;
		int re_step = 1;
		int re_level = 1;

		try {
			String refsql = "select NVL(max(ref),0) from board";
			ps = conn.prepareStatement(refsql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
