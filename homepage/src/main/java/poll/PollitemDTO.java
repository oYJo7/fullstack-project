package poll;

import java.util.Arrays;

public class PollitemDTO {
	private int num;
	private String content;
	private int parent; //설문조사 번호
	private String[] itemTitle; //설문조사 항목 제목
	private String[][] items; //항목별 내용
	private String item; //임시저장 항목
	private int type; //(1) 주관식 단답, (2) 주관식 서술, (3) 단일 선택, (4) 복수 선택
	private int count; //투표 수
	private String question; //설문 질문
	private String parents;
	public PollitemDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String[] getItemTitle() {
		return itemTitle;
	}
	public void setItemTitle(String[] itemTitle) {
		this.itemTitle = itemTitle;
	}
	public String[][] getItems() {
		return items;
	}
	public void setItems(String[][] items) {
		this.items = items;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getParents() {
		return parents;
	}
	public void setParents(String parents) {
		this.parents = parents;
	}
	public PollitemDTO(int num, String content, int parent, String[] itemTitle, String[][] items, String item, int type,
			int count, String question, String parents) {
		super();
		this.num = num;
		this.content = content;
		this.parent = parent;
		this.itemTitle = itemTitle;
		this.items = items;
		this.item = item;
		this.type = type;
		this.count = count;
		this.question = question;
		this.parents = parents;
	}
	@Override
	public String toString() {
		return "PollitemDTO [num=" + num + ", content=" + content + ", parent=" + parent + ", itemTitle="
				+ Arrays.toString(itemTitle) + ", items=" + Arrays.toString(items) + ", item=" + item + ", type=" + type
				+ ", count=" + count + ", question=" + question + ", parents=" + parents + "]";
	}
	
	
	
}
