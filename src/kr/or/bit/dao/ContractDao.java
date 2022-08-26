package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.Contract;
import kr.or.bit.dto.GenericUser;
import kr.or.bit.dto.REAUser;
import kr.or.bit.dto.Sale;
import kr.or.bit.utils.DB_Close;

public class ContractDao {
	/*
	 *	공인중개사 아이디로 계약서 찾기, 매물번호로 계약서 찾기, 계약서 추가, 수정, 삭제 클래스 
	 */
	DataSource ds = null;

	public ContractDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}
	
	public List<Contract> selectAllContracts(String id){ //공인중개사 아이디가 갖는 모든 계약서 가져오기
		//쿼리문 두개써서 잘 해봅시다 ^^. . .
		return null;
	}
	
	public Contract getContract(String aptNum) { //매물번호로 계약서 찾기
		return null;
	}
	
	public List<GenericUser> getContractUSer() { //유저 리스트 가져오기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GenericUser> glist = null;
		try {
			conn = ds.getConnection();
			String sql_select_conUser = "select userName, useraddr, userdetailaddr, frontresnum, backresnum, userphonenum from genericuser";
			pstmt = conn.prepareStatement(sql_select_conUser);
			rs = pstmt.executeQuery();
			glist = new ArrayList<GenericUser>();

			while (rs.next()) {
				GenericUser genericuser = new GenericUser();
				
				genericuser.setUserName(rs.getString("userName"));
				genericuser.setUserAddr(rs.getString("useraddr"));
				genericuser.setUserDetailAddr(rs.getString("userDetailAddr"));
				genericuser.setFrontResNum(rs.getString("frontResNum"));
				genericuser.setBackResNum(rs.getString("backResNum"));
				genericuser.setUserPhoneNum(rs.getString("userPhoneNum"));
				
				glist.add(genericuser);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
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
		return glist;
	}
	
	public Map<REAUser, Sale> getThisContract(String reaId, String aptNum) { //중개인과 해당 매물 정보 가져오기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Map<REAUser, Sale> mapList= null;
		REAUser reaUser = null;
		Sale sale = null;
		SaleDao saleDao = null;
		String sql = "select r.officeAddr, r.officeDetailAddr, r.officeName, r.reaName, r.officeHp, r.regNum, s.roadAddr, s.price, s.aptNum from reauser r join sale s on r.reaId = s.reaId where r.reaId=? and s.aptNum=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reaId);
			pstmt.setString(2, aptNum);
			
			rs = pstmt.executeQuery();			

			sale = new Sale();
			saleDao = new SaleDao();
			mapList = new HashMap<REAUser, Sale>();
			reaUser = new REAUser();
			
			if (rs.next()) {
				reaUser.setOfficeAddr(rs.getString("officeAddr"));
				reaUser.setOfficeDetailAddr(rs.getString("officeDetailAddr"));
				reaUser.setOfficeName(rs.getString("officeName"));
				reaUser.setReaName(rs.getString("reaName"));
				reaUser.setOfficeHp(rs.getString("officeHp"));
				reaUser.setRegNum(rs.getString("regNum")); //중개인 등록번호
				sale.setRoadAddr(rs.getString("roadAddr")); //아파트 도로명주소
				sale.setPrice(rs.getString("price"));
				sale.setAptNum(rs.getString("aptNum"));
				
				mapList.put(reaUser, sale);
				
				System.out.println(mapList);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
		return mapList;
	}
	
	public int updateContractSale(Sale sale) { // 계약된 매물 수정
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			
			//매물 테이블에 객체 넣기
			String sql_update_contractSale = "update sale set iscontract=? where aptNum=?";
			pstmt = conn.prepareStatement(sql_update_contractSale);
			pstmt.setString(1, "유");
			pstmt.setString(2, sale.getAptNum());
			resultRow = pstmt.executeUpdate();
			
			if(resultRow>0) {
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
	
	
	public List<Sale> getSaleContractList(String reaId) { // 매물 리스트 출력(계약 유무)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Sale> saleList = null;
		Sale sale = null;
		try {
			conn = ds.getConnection();
			String sql_select_contractSale = "select aptnum,aptsize,type,addr,aptname,aptdong,aptho,price from sale where reaId=? and isContract='유'";
			pstmt = conn.prepareStatement(sql_select_contractSale);
			pstmt.setString(1, reaId);
			rs = pstmt.executeQuery();
			saleList = new ArrayList<Sale>();
			while(rs.next()) {
				sale = new Sale();
				
				sale.setAptNum(rs.getString("aptNum")); //매물번호					
				sale.setAptSize(rs.getString("aptSize")); //면적
				sale.setType(rs.getString("type")); //유형
				sale.setAddr(rs.getString("addr")); //주소
				sale.setAptName(rs.getString("aptName")); //아파트이름
				sale.setAptDong(rs.getString("aptDong")); //동
				sale.setAptHo(rs.getString("aptHo")); //호수
				sale.setPrice(rs.getString("price")); //매매가
				saleList.add(sale);
			}

		}catch(Exception e) {
			
		}finally {
			DB_Close.close(pstmt);
			DB_Close.close(rs);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return saleList;
	}
	
}
