package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class movieDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DB연결
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
	
	//게시판 전체보기
		public Vector<movieBean> allselectMovie() {

			getConnection();

			Vector<movieBean> vec = new Vector<>();

			try {
				String sql = "select * from movie order by mno";

				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					movieBean bean = new movieBean();

					bean.setMno(rs.getString(1));
					bean.setTitle(rs.getString(2));
					bean.setGenre(rs.getString(3));
					bean.setCountry(rs.getString(4));
					bean.setRuntime(rs.getString(5));
					bean.setAge(rs.getString(6));
					bean.setOpendate(rs.getString(7));
					bean.setDirector(rs.getString(8));
					bean.setActor(rs.getString(9));
					bean.setStory(rs.getString(10));
					bean.setPoster(rs.getString(11));
					bean.setLove(rs.getInt(12));

					vec.add(bean);
				}
				if (conn != null) {
					conn.commit();
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vec;
		}
	
	
	
	
	
	
	
	
	
	
	
}
