package poll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import utility.DBClose;
import utility.DBOpen;

public class PollitemDAO {

	public int sumCount(int num) {
		int count = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select sum(count) from pollitem where num=?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return count;
	}

//	public Vector<PollitemDTO> getView(int num) {
//		Vector<PollitemDTO> vlist = new Vector<PollitemDTO>();
//		Connection con = DBOpen.open();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		StringBuffer sql = new StringBuffer();
//		sql.append(" select item, count from pollitem where num=? ");
//
//		try {
//
//			pstmt = con.prepareStatement(sql.toString());
//			pstmt.setInt(1, num);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				PollitemDTO idto = new PollitemDTO();
//				idto.setItem(rs.getString("item"));
//				idto.setCount(rs.getInt("count"));
//				vlist.add(idto);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBClose.close(rs, pstmt, con);
//		}
//		return vlist;
//	}

	public boolean voteItem(String[] parent) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update pollitem set count = count+1 where itemnum = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			for(int i=0; i < parent.length; i++) {
				pstmt.setInt(1, Integer.parseInt(parent[i]));
				pstmt.executeUpdate();
			}
//			for (int i = 0; i < itemnum.length; i++) {
//	            if (itemnum[i] == null || itemnum[i].equals(""))
//	                break;
//				pstmt.setInt(1, Integer.parseInt(itemnum[i]));
//				pstmt.executeUpdate();
//			}
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			DBClose.close(pstmt, con);
		}

		return flag;
	}

//	public Vector<PollitemDTO> itemList(int num) {
//		Vector<PollitemDTO> vlist = new Vector<PollitemDTO>();
//		Connection con = DBOpen.open();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		StringBuffer sql = new StringBuffer();
//		sql.append(" select * from pollitem where num = ?");
//
//		try {
//			pstmt = con.prepareStatement(sql.toString());
//			pstmt.setInt(1, num);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				PollitemDTO dto = new PollitemDTO();
//				dto.setItemnum(rs.getInt("itemnum"));
//				dto.setItem(rs.getString("item"));
//				dto.setCount(rs.getInt("count"));
//				dto.setNum(rs.getInt("num"));
//
//				vlist.add(dto);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBClose.close(rs, pstmt, con);
//		}
//		return vlist;
//	}
	
	public int getParent() {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select num from pollquestion ORDER BY num DESC LIMIT 1 ");

		int maxNum = 0;
		try {
			pstmt = con.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();
			if (rs.next())
				maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return maxNum;
	}
	
	public boolean createItems(PollitemDTO dto) {
		boolean flag = true;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		
		int tempType = dto.getType();
		if (tempType == 1 || tempType == 2) {
			sql.append("  insert into pollitem (parent, type) values(?, ?)  ");
		}else {
			sql.append("  insert into pollitem (parent, content, type) values(?, ?, ?)  ");
		}
		

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (tempType == 1 || tempType == 2) {
				pstmt.setInt(1, dto.getParent());
				pstmt.setInt(2, dto.getType());
			}else {
				pstmt.setInt(1, dto.getParent());
				pstmt.setString(2, dto.getItem());
				pstmt.setInt(3, dto.getType());
			}
	
			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean createQuestion(PollitemDTO dto) {
		boolean flag = true;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("  insert into pollquestion(parent, question)  ");
		sql.append("  values(?, ?)  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getParent());
			pstmt.setString(2, dto.getItem());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

}
