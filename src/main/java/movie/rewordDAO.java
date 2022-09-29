package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import oracle.net.aso.s;

public class rewordDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public Connection getConnection() {
		String Driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "admin";
		String pass = "1234";

		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url, id, pass);
			System.out.println("데이터베이스 연동에 성공하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동에 실패하였습니다.");
		}
		return conn;
	}
	
	/* 평점 평균 구하기 */
	public rewordBean getGrade_avg(String mno) {
		
		rewordBean rBean = new rewordBean();
		
		try {
			getConnection();

			String sql = "select round(avg(grade), 1) from reword where mno = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mno);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				rBean.setGrade_avg(rs.getDouble(1));

			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rBean;
	}
		
	/* mno(영화번호)에 대한 rno(댓글목록) 구하기 */
	
	public Vector<rewordBean> rewordSelectEach(String mno) {
		
		Vector<rewordBean> rvector = new Vector<>();
		
		try {
			getConnection();
			
			String sql = "select id, grade, writing from reword  where mno = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				rewordBean rBean3 = new rewordBean();

				rBean3.setId(rs.getString(1));
				rBean3.setGrade(rs.getDouble(2));
				rBean3.setWriting(rs.getString(3));

				rvector.add(rBean3);
			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rvector;
	}
	
	/* 댓글 삽입 */
	public void rewordinsert(rewordBean rBean) {
		
		try {
				getConnection();
				
			String sql = "insert into reword values(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rBean.getMno());
			pstmt.setString(2, rBean.getId());
			pstmt.setString(3, rBean.getTitle());
			pstmt.setDouble(4, rBean.getGrade());
			pstmt.setString(5, rBean.getWriting());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("아이디가 중복");
		}
	}
	
	//
	public Vector<rewordBean> allselectreword() {

		getConnection();

		Vector<rewordBean> rvec = new Vector<>();

		try {
			String sql = "select * from reword";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rewordBean rbean = new rewordBean();

				rbean.setMno(rs.getString(1));
				rbean.setId(rs.getString(2));
				rbean.setTitle(rs.getString(3));
				rbean.setGrade(rs.getInt(4));
				rbean.setWriting(rs.getString(5));

				rvec.add(rbean);
			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rvec;
	}

	

	// 수정용 반환 댓글 메소드 호출
	public rewordBean OneSelectreword(String id) {

		rewordBean rbean = new rewordBean();

		try {
			getConnection();

			String sql = "select * from reword where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				rbean.setMno(rs.getString(1));
				rbean.setId(rs.getString(2));
				rbean.setTitle(rs.getString(3));
				rbean.setGrade(rs.getInt(4));
				rbean.setWriting(rs.getString(5));

			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rbean;
	}



	//
	public void rewordUpdate(rewordBean rbean) {

		try {
			getConnection();

			String sql = "update reword set grade = ?, writing = ? where mno = ? and id = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setDouble(1, rbean.getGrade());
			pstmt.setString(2, rbean.getWriting());
			pstmt.setString(3, rbean.getMno());
			pstmt.setString(4, rbean.getId());

			pstmt.executeUpdate();

			if (conn != null) {
				conn.commit();
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 삭제 메소드 호출
	public void reworddelete(String id, String title) {

		try {
			getConnection();

			String sql = "delete from reword where id = ? and title = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.executeUpdate();

			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	
		
		//
		
		// Mno에 해당하는 id 호출 메소드
		public rewordBean findId(String mno) {
			
			rewordBean rbean = new rewordBean();
			
			try {
				getConnection();
					
				String sql = "select id from reword where mno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mno);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					
					rbean.setId(rs.getString(1));
					System.out.println(rs.getString(1));
					
				}
				if (conn != null) {
					conn.commit();
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return rbean;
		}
}
