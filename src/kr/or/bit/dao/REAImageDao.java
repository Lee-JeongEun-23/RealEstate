package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.REAImage;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.SaleImage;
import kr.or.bit.utils.DB_Close;

public class REAImageDao {
	DataSource ds = null;

	public REAImageDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	/* 공인중개사 이미지 넣기, 이미지 불러오기, 이미지 수정하기, 이미지 삭제(공인중개사 id로) */
	public int insertREAImg(REAImage reaImg) { // 공인중개사 이미지 넣기
		return 0;
	}

	public REAImage getREAImg(String reaId) { // 공인중개사 이미지 불러오기 (공인중개사 아이디로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		REAImage reaImg = null;
		String sql = "select reaImgSaveName from reaimage where reaid=(select reaid from reauser where reaid=?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reaId);
			reaImg = new REAImage();
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				reaImg.setReaImgSaveName(rs.getString("reaImgSaveName"));
			}

		} catch (Exception e) {
			System.out.println("Img 오류");
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
		return reaImg;
	}

	public int updateREAImg(REAImage reaImg) { // 공인중개사 이미지 수정
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql = "update REAImage set reaimgoriginname=?, reaImgSaveName=? where reaId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reaImg.getReaImgOriginName());
			pstmt.setString(2, reaImg.getReaImgSaveName());
			pstmt.setString(3, reaImg.getReaId());
			resultRow = pstmt.executeUpdate();
			if (resultRow > 0) {
				System.out.println("사진 업데이트 완료");
			}
		} catch (Exception e) {
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("update 예외");
			}

		}
		return resultRow;
	}

	public int deleteREAImg(String id) { // 공인중개사 이미지 삭제(공인중개사 id로)
		return 0;
	}
}
