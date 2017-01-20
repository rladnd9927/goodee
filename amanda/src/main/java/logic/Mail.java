package logic;

import org.springframework.web.multipart.MultipartFile;

public class Mail {
	private String recipient;
	private String title;
	private String mtype;
	private String editor1;
	private String contents;
	private MultipartFile file1;
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getEditor1() {
		return editor1;
	}
	public void setEditor1(String editor1) {
		this.editor1 = editor1;
	}
	public String getContents() {
		return editor1;
	}
	public void setContents(String contents) {
		this.editor1 = contents;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "Mail [recipient=" + recipient + ", title=" + title + ", mtype=" + mtype + ", editor1=" + editor1
				+ ", contents=" + contents + ", file1=" + file1 + "]";
	}
	
	
}
