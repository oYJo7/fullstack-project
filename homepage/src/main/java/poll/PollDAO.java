package poll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Vector;

import poll.PollDTO;

import utility.DBClose;
import utility.DBOpen;

public class PollDAO {
	
	

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
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBClose.close(rs, pstmt, con);
//		}
//		return vlist;
//	}
	
	public PollDTO read(int num) {
		PollDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from pollquestion where parent= ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new PollDTO();
				dto.setQuestion(rs.getString("question"));
				System.out.println("rs.getString(\"question\"): "+ rs.getString("question").length());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	
	public int getParent() {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select num from poll ORDER BY num DESC LIMIT 1 ");

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
	
	public Vector<PollitemDTO> readQuestion(int parent) {
		Vector<PollitemDTO> qlist = new Vector<PollitemDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select num, question from pollquestion where parent = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, parent);

			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				PollitemDTO dto = new PollitemDTO();
				dto.setNum(rs.getInt("num"));
				dto.setQuestion(rs.getString("question"));
				
				qlist.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return qlist;
	}
	

	public Vector<PollitemDTO> readPollItem(Vector<PollitemDTO> list) {
		Vector<PollitemDTO> qlist = new Vector<PollitemDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		String query=" select itemnum, parent, content, count, type from pollitem where parent=? ";
		for(int i=0; i < list.size()-1; i++ ) {
			if (i == list.size()-2) {
				query = query.concat(" or parent=? order by parent ");
			}else {
				query = query.concat(" or parent=? ");
			}
		}
		sql.append(query);

		try {
			pstmt = con.prepareStatement(sql.toString());
			for (int i=0; i < list.size(); i++ ) {
				PollitemDTO ldto = list.get(i);	
				pstmt.setInt(i+1, ldto.getNum());
			}
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				PollitemDTO dto = new PollitemDTO();
				dto.setNum(rs.getInt("itemnum"));
				dto.setParent(rs.getInt("parent"));
				dto.setContent(rs.getString("content"));
				dto.setCount(rs.getInt("count"));
				dto.setType(rs.getInt("type"));
				
				qlist.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return qlist;
	}

	public int upViewcnt(int parent) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update poll ");
		sql.append(" set view = view + 1 ");
		sql.append(" where num = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, parent);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return parent;
	}

	public int getMaxNum() {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select max(num) from poll ");

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

	public boolean create(PollDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into poll(title, sdate, edate, wdate) ");
		sql.append(" values(?, ?, ?, now()) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getSdate());
			pstmt.setString(3, dto.getEdate());

			int result = pstmt.executeUpdate();
			if (result > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public int total(Map map) {
		int total = 0;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word"); // 검색어
		StringBuffer sql = new StringBuffer();
		sql.append("  select count(*) from poll  ");
		if (word.trim().length() > 0)
			sql.append("  where " + col + " like concat('%', ?, '%')  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word);

			rs = pstmt.executeQuery();

			rs.next();

			total = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;
	}

	public Vector<PollDTO> getList(Map map) {
		Vector<PollDTO> list = new Vector<PollDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word"); // 검색어
		int sno = (int) map.get("sno");
		int eno = (int) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append("  select * from poll  ");
		if (word.trim().length() > 0)
			sql.append("  where " + col + " like concat('%', ?, '%')  ");
		sql.append("  order by num desc  ");
		sql.append("  limit ?, ?  ");

		try {
			int i = 0;

			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				PollDTO dto = new PollDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setSdate(rs.getString("sdate"));
				dto.setEdate(rs.getString("edate"));
				dto.setWdate(rs.getString("wdate"));
				dto.setView(rs.getInt("view"));
				

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
}