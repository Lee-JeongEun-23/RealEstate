package kr.or.bit.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.OfficeImage;
import kr.or.bit.dto.REAImage;

public class OfficeImageDao {
	DataSource ds = null;

	public OfficeImageDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	/* 공인중개사 사무소 이미지 넣기, 이미지 불러오기, 이미지 수정하기, 이미지 삭제(공인중개사 id로) */
	public int insertOfficeImg(OfficeImage officeImg) { // 공인중개사 사무소 이미지 넣기
		return 0;
	}

	public REAImage getOfficeImg(String reaId) { // 공인중개사 사무소 이미지 불러오기 (공인중개사 아이디로)
		return null;
	}

	public int updateOfficeImg(OfficeImage officeImg) { // 공인중개사 사무소 이미지 수정
		return 0;
	}

	public int deleteOfficeImg(String reaId) { // 공인중개사 사무소 이미지 삭제(공인중개사 id로)
		return 0;
	}
}
