package kr.or.bit.dto;

public class REAIntroBoard {
	private String id;
	private String subject;
	private String content;
	
	public REAIntroBoard() {}

	public REAIntroBoard(String id, String subject, String content) {
		super();
		this.id = id;
		this.subject = subject;
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "REAIntroBoard [id=" + id + ", subject=" + subject + ", content=" + content + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
