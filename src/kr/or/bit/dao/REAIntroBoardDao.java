package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.REAIntroBoard;
import kr.or.bit.utils.DB_Close;

public class REAIntroBoardDao {

	DataSource ds = null;

	public REAIntroBoardDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}
	/* 소개 페이지 넣기, 읽기, 수정, 삭제 */

	public int insertREAIntro(REAIntroBoard reaintro) { // 소개 페이지 넣기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_insert_reaIntro = "insert into reaintroboard(reaid, subject, content)"
					+"values((select reaid from reauser where reaid=?), ?, ?)";
			pstmt = conn.prepareStatement(sql_insert_reaIntro);
			pstmt.setString(1, reaintro.getId());
			pstmt.setString(2, reaintro.getSubject());
			pstmt.setString(3, reaintro.getContent());
			resultRow = pstmt.executeUpdate();
			if(resultRow > 0) {
				System.out.println("소개 페이지 db 등록 완료");
			}
						
		} catch (Exception e) {
			System.out.println("insertREAIntro 예외발생");
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close(); // 반환하기
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		return resultRow;
	}

	public REAIntroBoard getREAIntroData(String id) { // 소개 읽기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		REAIntroBoard reaIntro = null;
		try {
			conn = ds.getConnection();
			String select_sql = "SELECT REAID, SUBJECT, CONTENT "
								+ "FROM REAINTROBOARD WHERE REAID=?";
			pstmt = conn.prepareStatement(select_sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String reaId = rs.getString("reaId");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				reaIntro = new REAIntroBoard(reaId, subject, content);
				System.out.println("여기 타니?");

			}
		} catch (Exception e) {
			System.out.println("getREAIntroDao 예외발생");
			System.out.println(e.getMessage());
		} finally {
			try {
				pstmt.close();
				rs.close();
				conn.close(); // 반환하기
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		return reaIntro;
	}

	public int updateREAIntro(REAIntroBoard introBoard) { // 소개 수정(공인중개사 아이디로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_update_intro = "update reaintroboard set subject=?, content=? where reaId=?";
			pstmt = conn.prepareStatement(sql_update_intro);
			pstmt.setString(1, introBoard.getSubject());
			pstmt.setString(2, introBoard.getContent());
			pstmt.setString(3, introBoard.getId());
			resultRow = pstmt.executeUpdate();
			if(resultRow > 0) {
				System.out.println("업데이트 성공");
			}
		}catch(Exception e) {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return resultRow;
	}

	public int deleteREAIntro(String reaId) { // 소개 삭제(공인중개사 id로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String delete_intro = "delete from reaintroboard where reaid=?";
			pstmt = conn.prepareStatement(delete_intro);
			pstmt.setString(1, reaId);
			resultRow = pstmt.executeUpdate();
			if(resultRow > 0) {
				System.out.println("삭제 완료");
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultRow;
	}
	
	public boolean checkREAIntro(String reaId) { //소개글 유무 체크하는 함수
		boolean check = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql_check = "select subject, content from reaintroboard where reaid=?";
			pstmt = conn.prepareStatement(sql_check);
			pstmt.setString(1, reaId);
			rs = pstmt.executeQuery();
			if(rs.next()) { 
				check=true; //이미 등록된 소개글이 있다면
			}else {
				check=false;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(pstmt);
			try {
				conn.close(); // 반환하기
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return check;
	}
}
