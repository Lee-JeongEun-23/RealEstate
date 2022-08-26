package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.GenericUser;
import kr.or.bit.utils.DB_Close;

public class GenericUserDao {

	DataSource ds = null;

	public GenericUserDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	public String GenericUserLogin(String userId, String userPwd) { // 일반회원 로그인 191121 이정은
		String userType = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			String sql_genericUserLogin = "select userPwd, userCode from GenericUser where userId=? and userPwd=?";
			pstmt = conn.prepareStatement(sql_genericUserLogin);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rs = pstmt.executeQuery();
			System.out.println("GenericRS 호출 ****");
			if (rs.next()) {
				if (rs.getString("userCode").equals("B01")) {
					userType = "B01";
				} else if (!rs.getString("userCode").equals("B01")) {
					userType = "U01";
				}
			} else {
				userType = "false";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("GenericUserLogin 예외");
			}
		}
		return userType;
	}

	public int updateGenericUser(GenericUser user) { // 일반회원 수정
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_update_genericUser = "update GENERICUSER set userpwd=?, username=?, userphonenum=?, userAddr=?, userdetailAddr=?"
					+ " where userid=?";

			pstmt = conn.prepareStatement(sql_update_genericUser);
			pstmt.setString(1, user.getUserPwd());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserPhoneNum());
			pstmt.setString(4, user.getUserAddr());
			pstmt.setString(5, user.getUserDetailAddr());
			pstmt.setString(6, user.getUserId());

			resultRow = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("user update 실패");
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultRow;
	}

	public List<GenericUser> getGenericUserList() { // 개인회원 목록보기 191122 김진호
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GenericUser> glist = null;

		try {
			conn = ds.getConnection();
			String sql = "select userId, userName, frontResNum, userPhoneNum, userAddr from genericuser where usercode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "U01");
			rs = pstmt.executeQuery();
			glist = new ArrayList<GenericUser>();

			while (rs.next()) {
				GenericUser genericuser = new GenericUser();

				genericuser.setUserId(rs.getString("userId"));
				genericuser.setUserName(rs.getString("userName"));
				genericuser.setFrontResNum(rs.getString("frontResNum"));
				genericuser.setUserPhoneNum(rs.getString("userPhoneNum"));
				genericuser.setUserAddr(rs.getString("userAddr"));

				glist.add(genericuser);
			}

		} catch (Exception e) {
			System.out.println("guserdao 예외발생");
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("GenericUserLogin 예외");
			}
		}

		return glist;
	}

	public GenericUser getGenericMypage(String genericUserId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		GenericUser user = null;
		try {
			conn = ds.getConnection();
			String sql_select_user = "select userid, userpwd, username, frontresnum, backresnum, userphonenum, useraddr, userdetailaddr, usercode from genericuser "
					+ "where userid=?";
			pstmt = conn.prepareStatement(sql_select_user);
			pstmt.setString(1, genericUserId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("다오 가져오기 성공");
				user = new GenericUser();
				user.setUserId(rs.getString("userid"));
				user.setUserPwd(rs.getString("userpwd"));
				user.setUserName(rs.getString("userName"));
				user.setFrontResNum(rs.getString("frontResNum"));
				user.setBackResNum(rs.getString("backResNum"));
				user.setUserPhoneNum(rs.getString("userPhoneNum"));
				user.setUserAddr(rs.getString("useraddr"));
				user.setUserDetailAddr(rs.getString("userDetailAddr"));
				user.setUserCode(rs.getString("userCode"));
				System.out.println("DB에서 온 정보");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("genericuserdao 오류");
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}

	public int genericUserIdCheck(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = ds.getConnection();
			String sql = "select userId from genericuser where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result=1;
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("genericuserdao 오류");
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
}
