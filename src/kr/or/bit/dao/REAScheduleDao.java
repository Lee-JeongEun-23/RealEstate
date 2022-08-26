package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.REASchedule;
import kr.or.bit.utils.DB_Close;

public class REAScheduleDao {
	DataSource ds = null;

	public REAScheduleDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	public int insertSchedule(String reaId, String content, String scheDate) { //스케줄 db에 저장하기
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("scheDate" + scheDate);
		System.out.println("content" + content);
		System.out.println("reaId" + reaId);
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_insertSchedule = "insert into REASchedule(scheNum, scheDate, content, reaId)"
					+ "values(SEQ_SCHEDULE.nextval, ?, ?, (select reaid from reauser where reaid=?))";
			pstmt = conn.prepareStatement(sql_insertSchedule);
			pstmt.setTimestamp(1, new Timestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(scheDate.replace('T', ' ')).getTime()));
			pstmt.setString(2, content);
			pstmt.setString(3, reaId);
			
			resultRow = pstmt.executeUpdate();
			if (resultRow > 0) {
				System.out.println("reaSchedule db 생성 완료");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
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
	
	public List<REASchedule> getSchedule(String reaId) { // id에 저장된 스케줄 모두 가져오기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<REASchedule> sList = null;
		try {
			conn = ds.getConnection();
			String sql_get_schedule = "select scheNum, scheDate, content from REASchedule where reaId=?";
			pstmt = conn.prepareStatement(sql_get_schedule);
			pstmt.setString(1, reaId);
			rs = pstmt.executeQuery();
			sList = new ArrayList<REASchedule>();
			while(rs.next()) {
				REASchedule reaSchedule = new REASchedule();	
				reaSchedule.setScheNum(rs.getInt(1));
				reaSchedule.setScheDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(2)));
				reaSchedule.setContent(rs.getString(3)); //일정 내용
								
				sList.add(reaSchedule);
			}
		}catch(Exception e) {
			System.out.println("여기탄다");
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
		return sList;		
	}
	
	
	public int deleteREASchedule(String reaId, String scheNum) { // 스케줄 삭제하기
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_deleteSchedule = "delete from REASchedule where reaId=? and scheNum=?";
			pstmt = conn.prepareStatement(sql_deleteSchedule);
			pstmt.setString(1, reaId);
			pstmt.setString(2, scheNum);
			
			resultRow = pstmt.executeUpdate();
			if(resultRow > 0) {
				System.out.println("스케줄 삭제 완료");
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
