package bbs;

public class BbsDTO {
	/** 번호 */
	private int bbsno;
	/** 글쓴이 */
	private String wname;
	/** 제목 */
	private String title;
	/** 내용 */
	private String content;
	/** 패스워드 */
	private String passwd;
	/** 조회수 */
	private int viewcnt;
	/** 등록일 */
	private String wdate;
	/** 댓글 번호 */
	private int cmtno;
	/** 댓글 글쓴이 */ 
	private String cname;
	/** 댓글 내용 */
	private String cmtcontent;
	/** 댓글 패스워드 */
	private String cmtpasswd;
	/** 댓글 등록일 */
	private String cdate;
	/** 댓글 공감 */
	private int heart;
	/** 댓글 부모 */
	private String prent;
	public int getBbsno() {
		return bbsno;
	}
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getCmtno() {
		return cmtno;
	}
	public void setCmtno(int cmtno) {
		this.cmtno = cmtno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCmtcontent() {
		return cmtcontent;
	}
	public void setCmtcontent(String cmtcontent) {
		this.cmtcontent = cmtcontent;
	}
	public String getCmtpasswd() {
		return cmtpasswd;
	}
	public void setCmtpasswd(String cmtpasswd) {
		this.cmtpasswd = cmtpasswd;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	public String getPrent() {
		return prent;
	}
	public void setPrent(String prent) {
		this.prent = prent;
	}
	
	
}