package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.BookMark;
import kr.or.bit.utils.DB_Close;

public class BookMarkDao {
	/*
	 * 북마크 불러오기, 북마크 추가 삭제 기능 클래스
	 */
	
	DataSource ds = null;

	public BookMarkDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	public List<BookMark> getBookMark(String userId) { // id에 저장된 북마크 모두 가져오기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BookMark> bmList = null;
		try {
			conn = ds.getConnection();
			String sql_get_bookmark = "select b.aptNum, s.aptSize, s.type, s.aptName, s.price, i.saleimgsavename1 from bookmark b join sale s on b.aptNum = s.aptNum join saleimage i on s.aptNum = i.aptNum where userId=?";
			pstmt = conn.prepareStatement(sql_get_bookmark);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			bmList = new ArrayList<BookMark>();
			while(rs.next()) {
				BookMark bookmark = new BookMark();		
				bookmark.setAptNum(rs.getString(1)); //아파트 번호
				bookmark.setAptSize(rs.getString(2)); //아파트 면적			
				bookmark.setType(rs.getString(3)); //아파트 유형
				bookmark.setAptName(rs.getString(4)); //아파트 이름			
				bookmark.setPrice(rs.getString(5)); //아파트 가격
				bookmark.setSaleImgSaveName1(rs.getString(6)); //아파트 사진				
				bmList.add(bookmark);
			}

		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(pstmt);
			DB_Close.close(rs);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bmList;		
	}

	public int insertBookMark(BookMark bookMark) { //북마크 생성
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_insertBk = "insert into bookmark(userid, aptnum, bookdate)"
					+"values((select userid from genericuser where userid=?), (select aptnum from sale where aptnum=?),sysdate)";
			pstmt = conn.prepareStatement(sql_insertBk);
			pstmt.setString(1, bookMark.getUserId());
			pstmt.setString(2, bookMark.getAptNum());
			
			resultRow = pstmt.executeUpdate();
			if(resultRow > 0) {
				System.out.println("북마크 db 생성 완료");
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

	public int deleteBookMark(String userId, String aptNum) { // 북마크 삭제하기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_deleteBk = "delete from bookmark"
					+" where userid=(select userid from genericuser where userid=?) and aptnum=(select aptnum from sale where aptnum=?)";
			pstmt = conn.prepareStatement(sql_deleteBk);
			pstmt.setString(1, userId);
			pstmt.setString(2, aptNum);
			resultRow = pstmt.executeUpdate();
			if(resultRow > 0) {
				System.out.println("북마크 삭제 완료");
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
	
	
	public boolean checkBookMark(String userId, String aptNum) { //이미 북마크 되어 있는지 아닌지 체크하는 함수
		boolean check = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			String sql_check = "select bookdate from bookmark where userid=? and aptnum=?";
			pstmt = conn.prepareStatement(sql_check);
			pstmt.setString(1, userId);
			pstmt.setString(2, aptNum);
			rs = pstmt.executeQuery();
			if(rs.next()) { 
				check=true; //이미 저장된 북마크가 있다면
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
