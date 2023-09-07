package poll;

import java.util.Map;
import java.util.Vector;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PollService {

	private PollDAO dao;
	private PollitemDAO idao;

	public PollService() {
		dao = new PollDAO();
		idao = new PollitemDAO();
	}

	public boolean create(PollDTO dto, PollitemDTO idto) {
		boolean flag = false;

		try {
			dao.create(dto);
			idto.setParent(dao.getParent());
			String[] getItemTitle = idto.getItemTitle();
			//type 파싱
			String tempType =  Integer.toString(idto.getType());
			String[] getType = tempType.split("");

			for (int i = 0; i < idto.getItemTitle().length; i++) {
				//question 저장
				idto.setParent(dao.getParent());
				idto.setItem(getItemTitle[i]);
				idao.createQuestion(idto);
				
				//items 저장
				String[] tempItem = idto.getItems()[i];
				idto.setParent(idao.getParent());
				idto.setType(Integer.parseInt(getType[i]));
				if (tempItem.length > 0) {
					for (int j = 0; j < tempItem.length; j ++ ) {
						idto.setItem(tempItem[j]);
						idao.createItems(idto);
					}
				}else {
					idao.createItems(idto);
				}
			}
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public int total(Map map) {
		int total = 0;
		total = dao.total(map);

		return total;
	}

	public Vector<PollDTO> getList(Map map) {
		Vector<PollDTO> list = null;
		list = dao.getList(map);

		return list;
	}

	public int getMaxnum() {
		int num = 0;
		dao.getMaxNum();
		return num;
	}
	
	public int upViewcnt(int parent) {
		int cnt = 0;
		cnt = dao.upViewcnt(parent);
		return cnt;
	}

	public PollDTO read(int num) {
		PollDTO dto = null;
		dto = dao.read(num);
		return dto;
	}
	public boolean voteItem(String[] parent) {
		boolean flag = false;
		idao.voteItem(parent);
		flag = true;
		return flag;
	}
	public boolean insertVoteItem(int parent, int type, String anwser) {
		boolean flag = false;
		idao.insertVoteItem(parent, type, anwser);
		flag = true;
		return flag;
	}
	
	public Vector<PollitemDTO> readQuestion(int parent) {
		Vector<PollitemDTO> list = null;
		list = dao.readQuestion(parent);
		return list;
	}

	
	public Vector<PollitemDTO> readPollItem(Vector<PollitemDTO> list) {
		Vector<PollitemDTO> temp = null;
		temp = dao.readPollItem(list);
		return temp;
	}
	


//	public Vector<PollitemDTO> itemList(int num) {
//		Vector<PollitemDTO> list = null;
//		list = idao.itemList(num);
//		return list;
//
//	}
//	
//	/**
//	 * 투표 처리
//	 * @param itemnum
//	 * @return
//	 */
//
//	 public boolean updateCount(String[] itemnum) {
//	 
//	        boolean flag = false;
//	 
//	        flag = idao.updateCount(itemnum);
//	 
//	        return flag;
//	 
//	 }
//
//	public int sumCount(int num) {
//		if (num == 0)
//			num = dao.getMaxNum();
//		int count = idao.sumCount(num);
//		return count;
//	}
//
//	public Vector<PollitemDTO> getView(int num) {
//
//		if (num == 0)
//			num = dao.getMaxNum();
//		Vector<PollitemDTO> vlist = idao.getView(num);
//
//		return vlist;
//	}
}
