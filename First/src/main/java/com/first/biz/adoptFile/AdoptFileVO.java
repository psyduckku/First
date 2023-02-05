package com.first.biz.adoptFile;

public class AdoptFileVO {
	private String IMAGE_FILE_NO;
	private String IMAGE_FILE_NAME;
	private String STORED_FILE_NAME;
	private int FILE_SIZE;
	private String DEL_YN;
	private String SEQ;
	private String REGDATE;
	private String EXTENSION;
	
	public AdoptFileVO() {
	}
	
	

	/**
	 * @param iMAGE_FILE_NO
	 * @param iMAGE_FILE_NAME
	 * @param sTORED_FILE_NAME
	 * @param fILE_SIZE
	 * @param dEL_YN
	 * @param sEQ
	 * @param rEGDATE
	 * @param eXTENSION
	 */
	public AdoptFileVO(String iMAGE_FILE_NO, String iMAGE_FILE_NAME, String sTORED_FILE_NAME, int fILE_SIZE,
			String dEL_YN, String sEQ, String rEGDATE, String eXTENSION) {
		super();
		IMAGE_FILE_NO = iMAGE_FILE_NO;
		IMAGE_FILE_NAME = iMAGE_FILE_NAME;
		STORED_FILE_NAME = sTORED_FILE_NAME;
		FILE_SIZE = fILE_SIZE;
		DEL_YN = dEL_YN;
		SEQ = sEQ;
		REGDATE = rEGDATE;
		EXTENSION = eXTENSION;
	}





	public String getIMAGE_FILE_NO() {
		return IMAGE_FILE_NO;
	}
	public void setIMAGE_FILE_NO(String iMAGE_FILE_NO) {
		IMAGE_FILE_NO = iMAGE_FILE_NO;
	}
	public String getIMAGE_FILE_NAME() {
		return IMAGE_FILE_NAME;
	}
	public void setIMAGE_FILE_NAME(String iMAGE_FILE_NAME) {
		IMAGE_FILE_NAME = iMAGE_FILE_NAME;
	}
	public String getSEQ() {
		return SEQ;
	}
	public void setSEQ(String sEQ) {
		SEQ = sEQ;
	}
	public String getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}
	public String getEXTENSION() {
		return EXTENSION;
	}
	public void setEXTENSION(String eXTENSION) {
		EXTENSION = eXTENSION;
	}


	public String getSTORED_FILE_NAME() {
		return STORED_FILE_NAME;
	}


	public void setSTORED_FILE_NAME(String sTORED_FILE_NAME) {
		STORED_FILE_NAME = sTORED_FILE_NAME;
	}

	

	public int getFILE_SIZE() {
		return FILE_SIZE;
	}




	public void setFILE_SIZE(int fILE_SIZE) {
		FILE_SIZE = fILE_SIZE;
	}




	public String getDEL_YN() {
		return DEL_YN;
	}


	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	
	
	
}
