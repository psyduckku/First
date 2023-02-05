package com.first.biz.animalReplyBoard;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class AnimalReplyBoardVO {
	private String ID;
	private String ASEQ;
	private int ASEQ_REPLY;
	private String REGDATE;
	private String REPLY;
	private int ASEQ_LIKE;
	private int ASEQ_DISLIKE;
	
	public AnimalReplyBoardVO() {
	}
	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getASEQ() {
		return ASEQ;
	}
	public void setASEQ(String aSEQ) {
		ASEQ = aSEQ;
	}
	public int getASEQ_REPLY() {
		return ASEQ_REPLY;
	}
	public void setASEQ_REPLY(int aSEQ_REPLY) {
		ASEQ_REPLY = aSEQ_REPLY;
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
	public int getASEQ_LIKE() {
		return ASEQ_LIKE;
	}
	public void setASEQ_LIKE(int aSEQ_LIKE) {
		ASEQ_LIKE = aSEQ_LIKE;
	}
	public int getASEQ_DISLIKE() {
		return ASEQ_DISLIKE;
	}
	public void setASEQ_DISLIKE(int aSEQ_DISLIKE) {
		ASEQ_DISLIKE = aSEQ_DISLIKE;
	}

	
	
}
