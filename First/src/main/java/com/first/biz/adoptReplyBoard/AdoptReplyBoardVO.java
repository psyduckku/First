package com.first.biz.adoptReplyBoard;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class AdoptReplyBoardVO {
	private String ID;
	private String SEQ;
	private int SEQ_REPLY;
	private String REGDATE;
	private String REPLY;
	private int SEQ_LIKE;
	private int SEQ_DISLIKE;
	
	public AdoptReplyBoardVO() {
	}
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSEQ() {
		return SEQ;
	}
	public void setSEQ(String sEQ) {
		SEQ = sEQ;
	}
	public int getSEQ_REPLY() {
		return SEQ_REPLY;
	}
	public void setSEQ_REPLY(int sEQ_REPLY) {
		SEQ_REPLY = sEQ_REPLY;
	}
	public String getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}
	public String getREPLY() {
		return REPLY;
	}
	public void setREPLY(String rEPLY) {
		REPLY = rEPLY;
	}
	public int getSEQ_LIKE() {
		return SEQ_LIKE;
	}
	public void setSEQ_LIKE(int sEQ_LIKE) {
		SEQ_LIKE = sEQ_LIKE;
	}
	public int getSEQ_DISLIKE() {
		return SEQ_DISLIKE;
	}
	public void setSEQ_DISLIKE(int sEQ_DISLIKE) {
		SEQ_DISLIKE = sEQ_DISLIKE;
	}

	@Override
	public String toString() {
		return "AdoptReplyBoardVO [ID=" + ID + ", SEQ=" + SEQ + ", SEQ_REPLY=" + SEQ_REPLY + ", REGDATE=" + REGDATE
				+ ", REPLY=" + REPLY + ", SEQ_LIKE=" + SEQ_LIKE + ", SEQ_DISLIKE=" + SEQ_DISLIKE + "]";
	}
	
	
	
}
