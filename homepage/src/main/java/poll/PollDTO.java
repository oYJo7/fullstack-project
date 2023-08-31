package poll;

import java.util.Arrays;

public class PollDTO {
	private int num;
    private String title; // 설문 제목
    private String sdate; // 투표 시작 날짜
    private String edate; // 투표 종료 날짜
    private String wdate; // 설문 작성 날짜
    private int view; // 설문 조회수 
    private int active; // 설문 활성화 여부
    private String question; //설문 질문
	public PollDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PollDTO(int num, String title, String sdate, String edate, String wdate, int view, int active,
			String question) {
		super();
		this.num = num;
		this.title = title;
		this.sdate = sdate;
		this.edate = edate;
		this.wdate = wdate;
		this.view = view;
		this.active = active;
		this.question = question;
	}
	@Override
	public String toString() {
		return "PollDTO [num=" + num + ", title=" + title + ", sdate=" + sdate + ", edate=" + edate + ", wdate=" + wdate
				+ ", view=" + view + ", active=" + active + ", question=" + question + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
    
}
