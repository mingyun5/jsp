package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// �۾���
	public void insertBoard(BoardBean bean) {
		getCon();
		
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		
		try {
			String refsql = "select NVL(max(ref),0) from board";
			pstmt = con.prepareStatement(refsql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ref = rs.getInt(1) + 1;	// ���۾��� : �۱׷� �ִ밪 + 1
			}
			
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,0,?,'N')";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ��ü�� ��ȸ
	public Vector<BoardBean> getAllBoard() {
		Vector<BoardBean> vec = new Vector<>();
		
		getCon();
		
		try {
			String sql = "select * from board order by ref DESC, re_level ASC";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
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
				bean.setDel_flag(rs.getString(12));
				
				vec.add(bean);
			}
			
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vec;
	}
	
	// ��ȸ���� �����ϸ鼭 �ϳ��� �Խñ��� ����
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		
		getCon();
		
		try {
			// ��ȸ�� ����
			String readsql = "update board set readcount = readcount + 1 where num = ?";
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
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
			
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	// �������
	public void ReWriteBoard(BoardBean bean) {
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getCon();
		
		try {
			// 1. �θ�۰� ���� �׷��� ���� ������� -> �θ�ۺ��� ū re_level�� ���� ��� 1�� ����
			String levelsql = "update board set re_level = re_level + 1 where ref = ? and re_level > ?";
			
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();
			
			// 2. ��� ����
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?,'N')";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step + 1);
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, bean.getContent());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ��ȸ�� �������� �ϳ��� �Խñ��� ����
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		
		getCon();
		
		try {
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
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
			
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	// �ش� �Խñ��� ��й�ȣ�� ����
	public String getPass(int num) {
		String pass = "";
		
		getCon();
		
		try {
			/*String sql = "select password from board where num = ?";*/
			String sql = "update board set del_flag = 'Y' where num = ?"; //�� ������ ������Ʈ�� ó��
						
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass = rs.getString(1);
			}
			
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pass;
	}
	
	// �ش� �Խñ� �Ѱ��� ����
	public void updateBoard(BoardBean bean) {
		getCon();
		
		try {
			String sql = "update board set subject = ?, content = ? where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//�ش� �Խñ� �Ѱ��� ����
	public void deleteBoard(int num) {
		getCon();
		
		try {
			String sql = "delete from board where num = ?";
			
			//���� ���ఴü ���� �� ����
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//���� ����
			pstmt.executeUpdate();
			//�ڿ��ݳ�
			pstmt.close();
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


















