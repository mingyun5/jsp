package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
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
	
	public void insertMember(MemberBean mbean) {
		try {
			getCon();
			
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<MemberBean> SelectAllMember() {
		Vector<MemberBean> vec = new Vector<MemberBean>();
		
		try {
			getCon();
			
			String sql = "select * from member";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
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
	
	public MemberBean SelectOneMember(String id) {
		
		MemberBean bean = new MemberBean();
		
		try {
			getCon();
			
			String sql = "select * from member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			
			pstmt.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
		
	}
	
	public String getPass(String id) {
		
		String pass = "";
		
		try {
			getCon();
			
			String sql = "select pass1 from member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
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
	
	public void updateMember (MemberBean bean) {
		
		try {
			getCon();
			
			String sql = "update member set email=?, tel=?, hobby=?, job=?, age=?, info=? where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getHobby());
			pstmt.setString(4, bean.getJob());
			pstmt.setString(5, bean.getAge());
			pstmt.setString(6, bean.getInfo());
			pstmt.setString(7, bean.getId());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
		public void deleteMember (String id) {
			
			try {
				getCon();
				
				String sql = "delete from member where id=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				pstmt.executeUpdate();
				
				pstmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	
}
