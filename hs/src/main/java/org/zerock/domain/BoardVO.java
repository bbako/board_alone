package org.zerock.domain;

import java.sql.Timestamp;
import java.util.Arrays;

public class BoardVO {
	
	int bno, viewcnt, replycnt, filescnt;
	String title,content,writer;
	Timestamp regdate,updatedate;
	String[] files;
	
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getFilescnt() {
		return filescnt;
	}
	public void setFilescnt(int filescnt) {
		this.filescnt = filescnt;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Timestamp updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + ", filescnt=" + filescnt
				+ ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
