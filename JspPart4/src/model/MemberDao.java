package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/**
 * 오라클에 연결 > select , insert, delete 작업 실행
 * 
 * @author 201-13
 *
 */
public class MemberDao {
	/* 오라클에 접속 , 데이터 처리 */
	String id = "scott";
	String pass = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	Connection conn; // 오라클에 접속할 수 있게 설정하는 객체
	PreparedStatement ps; // 오라클에서 쿼리를 실행시켜주는 객체
	ResultSet rs; // 오라클에서 select 쿼리 결과를 리턴받아 저장하는 객체

	// 오라클에 연결하는 메서드
	public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pass);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 오라클 회원 한명을 insert하는 메서드

	public void insertMember(MemberBean mbean) {
		try {
			// 오라클에 접속
			getCon();

			/* 쿼리 준비 */
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);

			/* 쿼리에서 ?의 순어에 맞게 데이터 메핑 */
			ps.setString(1, mbean.getId());
			ps.setString(2, mbean.getPass1());
			ps.setString(3, mbean.getEmail());
			ps.setString(4, mbean.getTel());
			ps.setString(5, mbean.getHobby());
			ps.setString(6, mbean.getJob());
			ps.setString(7, mbean.getAge());
			ps.setString(8, mbean.getInfo());

			/* 쿼리 실행 */
			ps.executeUpdate(); // insert, update, delete 시 사용하는 메서드

			/* 자원 반납 */
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 3. 모든 회원정보를 조회하여 리턴하는 메서드

	public Vector<MemberBean> selectAllMember() {
		Vector<MemberBean> vec = new Vector<MemberBean>();
		try {
			getCon();

			String sql = "select * from member";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
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

			ps.close();
			rs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return vec;
	}

	public MemberBean SelectOneMember(String id) {

		MemberBean bean = new MemberBean();

		try {
			getCon();

			String sql = "select * from member where id =?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();

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
			
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}

}
