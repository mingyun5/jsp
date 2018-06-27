package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

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
				ref = rs.getInt(1) + 1; // 글그룹 최대값 +1
			}
			
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,0,?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, bean.getWriter());
			ps.setString(2, bean.getEmail());
			ps.setString(3, bean.getSubject());
			ps.setString(4, bean.getPassword());
			ps.setInt(5, ref);
			ps.setInt(6, re_step);
			ps.setInt(7, re_level);
			ps.setString(8, bean.getContent());
			
			ps.executeUpdate();
			
			rs.close();
			ps.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
// 전체글 조회
	public Vector<BoardBean> getAllBoard(){
		Vector<BoardBean> vec = new Vector<>();
		getCon();
		
		try {
			String sql = "select * from board order by ref desc, re_level ASC";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				
				vec.add(bean);
			}
			
			rs.close();
			ps.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vec;
	}
	
	//게시글 조회
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();
		try {
			//조회수 증가
			String readsql = "update board set READCOUNT = READCOUNT + 1 where num = ?";
			ps = conn.prepareStatement(readsql);
			ps.setInt(1, num);
			ps.executeUpdate();
			
			String sql = "select * from board where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
}
