package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Db {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection () throws Exception{ // db connection�� ��� �Լ�
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "hr";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, user, password);
		return con;
	};

	// Create User
	public boolean createUser (String custname,String phone,String address,String joindate,String grade,String city) {
		boolean result = false;
		String sql = "INSERT INTO member_tbl_02 VALUES (seq.NEXTVAL,?,?,?,?,?,?)";

		try {
			conn = getConnection(); // DB connection�� ����
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, custname); 
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.executeQuery(); 

			result = true; // insert ���� �� true ��ȯ
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close(); // db connection close
				pstmt.close(); // statement close
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
			return result;
		}
	}

	// register���� ȸ�� ��ȣ�� �����ִ� �Լ�
	public ResultSet selectCustno () {
		String sql = "SELECT MAX(custno)+1 FROM member_tbl_02";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return rs;
		}
	}

	// ȸ�� ��� ��ȸ
	public ResultSet selectUserList() {
		String sql = "SELECT custno, custname, phone, address, TO_CHAR(joindate,'YYYY-MM-DD'),grade,city FROM member_tbl_02 ORDER BY custno ASC";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return rs;
		}
	}

	// ȸ�� ���� ��ȸ
	public ResultSet selectUser (String custno) {
		String sql = "SELECT custno,custname,phone,address,TO_CHAR(joindate,'YYYY-MM-DD'),grade,city FROM member_tbl_02 WHERE custno = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(custno));
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			return rs;
		}
	}

	// ȸ�� ���� ����
	public boolean updateUser (String custname,String phone,String address,String joindate,String grade,String city,String custno) {
		boolean result = false;
		String sql = "UPDATE member_tbl_02 SET custname = ? , phone = ? , address = ?, joindate = ? , grade = ? , city = ? WHERE custno = ?";

		try {
			conn = getConnection(); // DB connection�� ����
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, custname); 
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setInt(7, Integer.parseInt(custno));
			pstmt.executeQuery(); 

			result = true; // insert ���� �� true ��ȯ
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close(); // db connection close
				pstmt.close(); // statement close
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
			return result;
		}
	}
	
	// ȸ�� ���� ���� ��ȸ
		public ResultSet selectMoneyList() {
			String sql = "SELECT e.custno, e.custname, e.grade , m.price FROM member_tbl_02 e , (SELECT custno, sum(price) price FROM money_tbl_02 GROUP BY custno) m WHERE e.custno = m.custno";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				return rs;
			}
		}

	

}
