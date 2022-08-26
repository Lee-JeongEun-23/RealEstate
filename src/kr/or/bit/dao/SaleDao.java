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

import kr.or.bit.dto.Sale;
import kr.or.bit.dto.SaleImage;
import kr.or.bit.utils.DB_Close;

public class SaleDao {

	DataSource ds = null;

	public SaleDao() throws NamingException {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}

	public int insertSale(Sale sale) { // 매물 넣기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			String sql_insert_sale = "insert into sale(aptNum, aptSize, type, addr, roadAddr, aptName, aptDong, aptHo, price, direction, etc, isContract,reaId)"
					+ " values(seq_aptNum.nextval, ?,(select type from type where type=?),?,?,?,?,?,?,?,?,?,(select reaid from reauser where reaid=?))";
			pstmt = conn.prepareStatement(sql_insert_sale);
			pstmt.setString(1, sale.getAptSize());
			pstmt.setString(2, sale.getType());
			pstmt.setString(3, sale.getAddr());
			pstmt.setString(4, sale.getRoadAddr());
			pstmt.setString(5, sale.getAptName());
			pstmt.setString(6, sale.getAptDong());
			pstmt.setString(7, sale.getAptHo());
			pstmt.setString(8, sale.getPrice());
			pstmt.setString(9, sale.getDirection());
			pstmt.setString(10, sale.getEtc());
			pstmt.setString(11, sale.getIsContract());
			pstmt.setString(12, sale.getId());
			resultRow = pstmt.executeUpdate();

			if (resultRow > 0) {
				System.out.println("매물 정보 DB 등록 성공");
			}
		} catch (Exception e) {
			System.out.println("e.getMessage(): " + e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return resultRow;
	}

	public Sale getSaleDataByAptNum(String aptNum) { // 매물 한개 읽기 (매물 번호로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Sale sale = null;
		try {
			conn = ds.getConnection();
			String sql_select_aptInfo = "select aptnum, aptsize, type, addr, aptname, aptdong, aptho, price, direction, etc, iscontract, reaid from sale"
					+ " where aptnum=?";
			pstmt = conn.prepareStatement(sql_select_aptInfo);
			pstmt.setString(1, aptNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sale = new Sale();
				sale.setAptNum(rs.getString("aptNum"));
				sale.setAptSize(rs.getString("aptSize"));
				sale.setType(rs.getString("type"));
				sale.setAddr(rs.getString("addr"));
				sale.setAptName(rs.getString("aptName"));
				sale.setAptDong(rs.getString("aptDong"));
				sale.setAptHo(rs.getString("aptHo"));
				sale.setPrice(rs.getString("price"));
				sale.setDirection(rs.getString("direction"));
				sale.setEtc(rs.getString("etc"));
				sale.setIsContract(rs.getString("isContract"));
				sale.setId(rs.getString("reaId"));
			}
			System.out.println("DB에서 온 아파트 정보" + sale.toString());

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
		return sale;
	}

	public String getAptNumByAptInfo(String aptName, String aptDong, String aptHo) { // 매물 번호 읽기 (아파트 이름, 동, 호수로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String aptNum = "";
		try {
			conn = ds.getConnection();
			String sql_select_aptInfo = "select aptnum from sale where aptname=? and aptdong=? and aptho=?";
			pstmt = conn.prepareStatement(sql_select_aptInfo);
			pstmt.setString(1, aptName);
			pstmt.setString(2, aptDong);
			pstmt.setString(3, aptHo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				aptNum = rs.getString("aptNum");
			}
			System.out.println(aptNum);

		} catch (Exception e) {
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

		return aptNum;
	}
	
	public List<String> getAptNumByAddr(String addr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> aptNumList = new ArrayList<String>();
		String aptNum="";
		try {
			conn = ds.getConnection();
			String sql = "select aptNum from sale where addr like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+addr+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				aptNum = rs.getString("aptNum");
				aptNumList.add(aptNum);
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return aptNumList;
	}
	

	public List<Sale> getSaleList(String id) { // 매물 리스트 출력(공인중개사 아이디로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Sale> saleList = null;

		try {
			conn = ds.getConnection();
			String sql_select_sale = "select aptnum,aptsize,type,addr,aptname,aptdong,aptho,price,iscontract from sale where reaid=?";
			pstmt = conn.prepareStatement(sql_select_sale);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			saleList = new ArrayList<Sale>();
			while (rs.next()) {
				Sale sale = new Sale();
				sale.setAptNum(rs.getString("aptNum")); // 매물번호
				sale.setAptSize(rs.getString("aptSize")); // 면적
				sale.setType(rs.getString("type")); // 유형
				sale.setAddr(rs.getString("addr")); // 주소
				sale.setAptName(rs.getString("aptName")); // 아파트이름
				sale.setAptDong(rs.getString("aptDong")); // 동
				sale.setAptHo(rs.getString("aptHo")); // 호수
				sale.setPrice(rs.getString("price")); // 매매가
				sale.setIsContract(rs.getString("isContract"));
				saleList.add(sale);
			}
		} catch (Exception e) {

		} finally {
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
	
	public List<Sale> getSaleList(String id, int cPage, int pageSize) { // 매물 리스트 출력(공인중개사 아이디로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Sale> saleList = null;
		
		try {
			conn = ds.getConnection();
			String sql_select_sale = "select X.rnum, X.aptnum, X.aptsize, X.type, X.addr, X.roadaddr, X.aptname, X.aptdong, X.aptho, X.price, X.direction, X.etc, X.iscontract, X.reaid from (select rownum as rnum, A.aptnum, A.aptsize, A.type, A.addr, A.roadaddr, A.aptname, A.aptdong, A.aptho, A.price, A.direction, A.etc, A.iscontract, A.reaid from (select aptnum, aptsize, type, addr, roadaddr, aptname, aptdong, aptho, price, direction, etc, iscontract, reaid from sale order by aptnum) A where rownum <= ?) X where X.rnum >= ? and reaId =?";
			
			pstmt = conn.prepareStatement(sql_select_sale);
			
			int start = cPage * pageSize - (pageSize - 1);
			int end = cPage * pageSize;
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			pstmt.setString(3, id);
			
			rs = pstmt.executeQuery();
			
			System.out.println("RSRSRSRS");
			
			saleList = new ArrayList<Sale>();
			while (rs.next()) {
				
				Sale sale = new Sale();
				sale.setAptNum(rs.getString("aptNum")); // 매물번호
				sale.setAptSize(rs.getString("aptSize")); // 면적
				sale.setType(rs.getString("type")); // 유형
				sale.setAddr(rs.getString("addr")); // 주소
				sale.setAptName(rs.getString("aptName")); // 아파트이름
				sale.setAptDong(rs.getString("aptDong")); // 동
				sale.setAptHo(rs.getString("aptHo")); // 호수
				sale.setPrice(rs.getString("price")); // 매매가
				sale.setIsContract(rs.getString("isContract"));
				saleList.add(sale);
			}
		} catch (Exception e) {
			
		} finally {
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
	
	public int getSaleListCount(String id) { // 매물 리스트 출력(공인중개사 아이디로)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Sale> saleList = null;
		int count=0;
		
		try {
			conn = ds.getConnection();
			String sql_select_sale = "select aptnum,aptsize,type,addr,aptname,aptdong,aptho,price,iscontract from sale where reaid=?";
			pstmt = conn.prepareStatement(sql_select_sale);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			saleList = new ArrayList<Sale>();
			while (rs.next()) {
				Sale sale = new Sale();
				sale.setAptNum(rs.getString("aptNum")); // 매물번호
				sale.setAptSize(rs.getString("aptSize")); // 면적
				sale.setType(rs.getString("type")); // 유형
				sale.setAddr(rs.getString("addr")); // 주소
				sale.setAptName(rs.getString("aptName")); // 아파트이름
				sale.setAptDong(rs.getString("aptDong")); // 동
				sale.setAptHo(rs.getString("aptHo")); // 호수
				sale.setPrice(rs.getString("price")); // 매매가
				sale.setIsContract(rs.getString("isContract"));
				saleList.add(sale);
				count++;
			}
		} catch (Exception e) {
			
		} finally {
			DB_Close.close(pstmt);
			DB_Close.close(rs);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	public int updateSale(Sale sale) { // 매물 수정 (2019/11/24/알파카)
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();

			// 매물 테이블에 객체 넣기
			String sql_update_sale = "update sale set aptsize=?,type=(select type from type where type=?),addr=?,aptname=?,aptdong=?,aptho=?,price=?,direction=?,etc=?,iscontract=?"
					+ " where aptnum=?";
			pstmt = conn.prepareStatement(sql_update_sale);
			pstmt.setString(1, sale.getAptSize());
			pstmt.setString(2, sale.getType());
			pstmt.setString(3, sale.getAddr());
			pstmt.setString(4, sale.getAptName());
			pstmt.setString(5, sale.getAptDong());
			pstmt.setString(6, sale.getAptHo());
			pstmt.setString(7, sale.getPrice());
			pstmt.setString(8, sale.getDirection());
			pstmt.setString(9, sale.getEtc());
			pstmt.setString(10, sale.getIsContract());
			pstmt.setString(11, sale.getAptNum());
			resultRow = pstmt.executeUpdate();

			if (resultRow > 0) {
				System.out.println("매물 정보 DB 수정 성공");
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

	public int deleteSale(String aptNum) { // 매물 삭제(매물 번호로) (2019/11/25/알파카)
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultRow = 0;
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);

			String sql_delete_saleImg = "delete from saleImage where aptnum=?";
			String sql_delete_sale = "delete from sale where aptnum=?";

			pstmt = conn.prepareStatement(sql_delete_saleImg);
			pstmt.setString(1, aptNum);
			resultRow = pstmt.executeUpdate();
			System.out.println("resultRow 1 " + resultRow);

			pstmt = conn.prepareStatement(sql_delete_sale);
			pstmt.setString(1, aptNum);
			resultRow = pstmt.executeUpdate();
			System.out.println("resultRow 2 " + resultRow);

			if (resultRow > 0) {
				conn.commit();
				System.out.println("매물 삭제 완료");

			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("delete sale dao 오류");
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

	public Map<Sale, SaleImage> selectAtpList(String addr, int cPage, int pageSize) { // 주소로 아파트 이름, 아파트 동, 아파트 가격 조회(매물 보는 첫 페이지)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<Sale, SaleImage> mapList = null;
		Sale sale = null;
		SaleImage saleImg = null;
		SaleImageDao imgDao = null;
		String sql_select_aptList = "select X.rnum, X.aptnum, X.aptsize, X.type, X.addr, X.roadaddr, X.aptname, X.aptdong, X.aptho, X.price, X.direction, X.etc, X.iscontract, X.reaid from (select rownum as rnum, A.aptnum, A.aptsize, A.type, A.addr, A.roadaddr, A.aptname, A.aptdong, A.aptho, A.price, A.direction, A.etc, A.iscontract, A.reaid from (select aptnum, aptsize, type, addr, roadaddr, aptname, aptdong, aptho, price, direction, etc, iscontract, reaid from sale where addr like ? order by aptnum) A where rownum <= ?) X where X.rnum >=? and  X.iscontract='무'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql_select_aptList);
			int start = cPage * pageSize - (pageSize - 1);
			int end = cPage * pageSize;
			
			pstmt.setString(1, "%" + addr + "%");
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			rs = pstmt.executeQuery();

			imgDao = new SaleImageDao();
			mapList = new HashMap<Sale, SaleImage>();
			while (rs.next()) {
				sale = new Sale();
				sale.setRoadAddr(rs.getString("roadAddr"));
				sale.setAptName(rs.getString("aptName")); // 아파트 이름
				sale.setAptDong(rs.getString("aptDong")); // 아파트 동
				sale.setPrice(rs.getString("price")); // 가격
				sale.setAptNum(rs.getString("aptNum")); // 매물번호
				sale.setAptSize(rs.getString("aptSize")); // 아파트 사이즈
				sale.setEtc(rs.getString("etc"));
				sale.setAddr(rs.getString("addr"));
				String aptNum = sale.getAptNum();
				saleImg = new SaleImage();
				saleImg = imgDao.getSaleImg(aptNum);
				mapList.put(sale, saleImg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mapList;
	}
	public int selectAtpListCount(String addr) { // 주소로 아파트 이름, 아파트 동, 아파트 가격 조회(매물 보는 첫 페이지)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Map<Sale, SaleImage> mapList = null;
		Sale sale = null;
		SaleImage saleImg = null;
		SaleImageDao imgDao = null;
		String sql_select_aptList = "select aptname, aptdong, price, aptNum, aptSize, etc, addr from sale where addr like ?";
		int count=0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql_select_aptList);
			pstmt.setString(1, "%" + addr + "%");
			rs = pstmt.executeQuery();
			
			imgDao = new SaleImageDao();
			mapList = new HashMap<Sale, SaleImage>();
			
			while (rs.next()) {
				sale = new Sale();
				sale.setAptName(rs.getString("aptName")); // 아파트 이름
				sale.setAptDong(rs.getString("aptDong")); // 아파트 동
				sale.setPrice(rs.getString("price")); // 가격
				sale.setAptNum(rs.getString("aptNum")); // 매물번호
				sale.setAptSize(rs.getString("aptSize")); // 아파트 사이즈
				sale.setEtc(rs.getString("etc"));
				sale.setAddr(rs.getString("addr")); //지번주소
				String aptNum = sale.getAptNum();
				saleImg = new SaleImage();
				saleImg = imgDao.getSaleImg(aptNum);
				mapList.put(sale, saleImg);
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	public Sale getSaleDetail(String aptNum) { // 아파트 매물 번호로 매물 정보 가져오기 (SaleDetail 페이지)
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Sale sale = null;
		String sql_get_saleDetail = "select roadAddr, aptName,aptSize,Type,aptDong,price,Direction,etc, reaId from sale where aptNum=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql_get_saleDetail);
			pstmt.setString(1, aptNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sale = new Sale();
				sale.setRoadAddr(rs.getString("roadAddr")); // 아파트 지번 주소
				sale.setAptName(rs.getString("aptName")); // 아파트 이름
				sale.setAptSize(rs.getString("aptSize")); // 아파트 면적
				sale.setType(rs.getString("type")); // 매물 유형
				sale.setAptDong(rs.getString("aptDong")); // 아파트 동
				sale.setPrice(rs.getString("price")); // 매매가격
				sale.setDirection(rs.getString("direction")); // 아파트 향
				sale.setEtc(rs.getString("etc")); // 특징
				sale.setId(rs.getString("reaId")); // 공인중개사 아이디
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sale;
	}

	public ArrayList<Sale> getAddr() { // 주소가져오기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Sale> saleList = null;
		String sql_get_addr = "select addr from sale";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql_get_addr);
			rs = pstmt.executeQuery();
			saleList = new ArrayList<Sale>();
			while (rs.next()) {
				Sale sale = new Sale();
				sale.setAddr(rs.getString("addr"));
				saleList.add(sale);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return saleList;
	}

	public int getTotalSaleCount() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) cnt from sale";
		int totalcount = 0;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("Next 들어옴");
				totalcount = rs.getInt("cnt");
				System.out.println(totalcount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalcount;
	}
}
