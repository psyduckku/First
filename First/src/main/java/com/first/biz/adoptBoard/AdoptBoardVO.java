package com.first.biz.adoptBoard;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class AdoptBoardVO {
	
	private String ID;
	private String SEQ;
	private String PARENT_SEQ;
	private String DEPTH;
	private String GPORD;
	private String TITLE;
	private String CONTENT;
	private String PSWD;
	private String REGDATE;
	private int CNT;
	private String searchCondition;
	private String searchKeyword;
	private int FLAG_POST;
	private String STORED_FILE_NAME;
	
	public AdoptBoardVO() {
	}
	//join쿼리시 사용
	public String getSTORED_FILE_NAME() {
		return STORED_FILE_NAME;
	}
	public void setSTORED_FILE_NAME(String sTORED_FILE_NAME) {
		STORED_FILE_NAME = sTORED_FILE_NAME;
	}

	public int getFLAG_POST() {
		return FLAG_POST;
	}
	public void setFLAG_POST(int fLAG_POST) {
		FLAG_POST = fLAG_POST;
	}
	public void setPARENT_SEQ(String pARENT_SEQ) {
		PARENT_SEQ = pARENT_SEQ;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSEQ() {
		return SEQ;
	}
	public void setSEQ(String sEQ) {
		SEQ = sEQ;
	}
	
	public String getPARENT_SEQ() {
		return PARENT_SEQ;
	}
	public void setPARENT_NO(String pARENT_SEQ) {
		PARENT_SEQ = pARENT_SEQ;
	}
	
	public String getDEPTH() {
		return DEPTH;
	}
	public void setDEPTH(String dEPTH) {
		DEPTH = dEPTH;
	}
	public String getGPORD() {
		return GPORD;
	}
	public void setGPORD(String gPORD) {
		GPORD = gPORD;
	}
	public int getCNT() {
		return CNT;
	}
	public void setCNT(int cNT) {
		CNT = cNT;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getPSWD() {
		return PSWD;
	}
	public void setPSWD(String pSWD) {
		PSWD = pSWD;
	}
	public String getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}
	
	
	
}
