package com.first.biz.animalBoard;

import com.fasterxml.jackson.annotation.JsonInclude;

//@Getter
//@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AnimalBoardVO {
	
	private String SIGUN_CD; //시군코드
	private String SIGUN_NM; //시군명
	private String ABDM_IDNTFY_NO; //유기고유번호
	private String RECEPT_DE; // 접수일자
	private String DISCVRY_PLC_INFO; // 발견장소
	private String STATE_NM; // 상태
	private String PBLANC_IDNTFY_NO; // 공고고유번호
	private String PBLANC_BEGIN_DE; // 공고시작일자
	private String PBLANC_END_DE; // 공고종료일자
	private String SPECIES_NM; // 품종
	private String COLOR_NM; // 색상
	private String AGE_INFO; // 나이
	private String BDWGH_INFO; // 체중
	private String SEX_NM; // 성별
	private String NEUT_YN; // 중성화여부
	private String SFETR_INFO; // 특징
	private String SHTER_NM; // 보호소명
	private String SHTER_TELNO; // 보호소전화번호
	private String PROTECT_PLC; // 보호장소
	private String REFINE_ROADNM_ADDR; // 보호소도로명주소
	private String REFINE_LOTNO_ADDR; // 보호소지번주소
	private String REFINE_ZIP_CD; // 보호소우편번호
	private String JURISD_INST_NM; // 관할기관
	private String IMAGE_COURS; // 이미지경로
	private String sortRegion;
	private String sortAnimal;
	private String ASEQ;
	public String getSIGUN_CD() {
		return SIGUN_CD;
	}
	public void setSIGUN_CD(String sIGUN_CD) {
		SIGUN_CD = sIGUN_CD;
	}
	public String getSIGUN_NM() {
		return SIGUN_NM;
	}
	public void setSIGUN_NM(String sIGUN_NM) {
		SIGUN_NM = sIGUN_NM;
	}
	public String getABDM_IDNTFY_NO() {
		return ABDM_IDNTFY_NO;
	}
	public void setABDM_IDNTFY_NO(String aBDM_IDNTFY_NO) {
		ABDM_IDNTFY_NO = aBDM_IDNTFY_NO;
	}
	public String getRECEPT_DE() {
		return RECEPT_DE;
	}
	public void setRECEPT_DE(String rECEPT_DE) {
		RECEPT_DE = rECEPT_DE;
	}
	public String getDISCVRY_PLC_INFO() {
		return DISCVRY_PLC_INFO;
	}
	public void setDISCVRY_PLC_INFO(String dISCVRY_PLC_INFO) {
		DISCVRY_PLC_INFO = dISCVRY_PLC_INFO;
	}
	public String getSTATE_NM() {
		return STATE_NM;
	}
	public void setSTATE_NM(String sTATE_NM) {
		STATE_NM = sTATE_NM;
	}
	public String getPBLANC_IDNTFY_NO() {
		return PBLANC_IDNTFY_NO;
	}
	public void setPBLANC_IDNTFY_NO(String pBLANC_IDNTFY_NO) {
		PBLANC_IDNTFY_NO = pBLANC_IDNTFY_NO;
	}
	public String getPBLANC_BEGIN_DE() {
		return PBLANC_BEGIN_DE;
	}
	public void setPBLANC_BEGIN_DE(String pBLANC_BEGIN_DE) {
		PBLANC_BEGIN_DE = pBLANC_BEGIN_DE;
	}
	public String getPBLANC_END_DE() {
		return PBLANC_END_DE;
	}
	public void setPBLANC_END_DE(String pBLANC_END_DE) {
		PBLANC_END_DE = pBLANC_END_DE;
	}
	public String getSPECIES_NM() {
		return SPECIES_NM;
	}
	public void setSPECIES_NM(String sPECIES_NM) {
		SPECIES_NM = sPECIES_NM;
	}
	public String getCOLOR_NM() {
		return COLOR_NM;
	}
	public void setCOLOR_NM(String cOLOR_NM) {
		COLOR_NM = cOLOR_NM;
	}
	public String getAGE_INFO() {
		return AGE_INFO;
	}
	public void setAGE_INFO(String aGE_INFO) {
		AGE_INFO = aGE_INFO;
	}
	public String getBDWGH_INFO() {
		return BDWGH_INFO;
	}
	public void setBDWGH_INFO(String bDWGH_INFO) {
		BDWGH_INFO = bDWGH_INFO;
	}
	public String getSEX_NM() {
		return SEX_NM;
	}
	public void setSEX_NM(String sEX_NM) {
		SEX_NM = sEX_NM;
	}
	public String getNEUT_YN() {
		return NEUT_YN;
	}
	public void setNEUT_YN(String nEUT_YN) {
		NEUT_YN = nEUT_YN;
	}
	public String getSFETR_INFO() {
		return SFETR_INFO;
	}
	public void setSFETR_INFO(String sFETR_INFO) {
		SFETR_INFO = sFETR_INFO;
	}
	public String getSHTER_NM() {
		return SHTER_NM;
	}
	public void setSHTER_NM(String sHTER_NM) {
		SHTER_NM = sHTER_NM;
	}
	public String getSHTER_TELNO() {
		return SHTER_TELNO;
	}
	public void setSHTER_TELNO(String sHTER_TELNO) {
		SHTER_TELNO = sHTER_TELNO;
	}
	public String getPROTECT_PLC() {
		return PROTECT_PLC;
	}
	public void setPROTECT_PLC(String pROTECT_PLC) {
		PROTECT_PLC = pROTECT_PLC;
	}
	public String getREFINE_ROADNM_ADDR() {
		return REFINE_ROADNM_ADDR;
	}
	public void setREFINE_ROADNM_ADDR(String rEFINE_ROADNM_ADDR) {
		REFINE_ROADNM_ADDR = rEFINE_ROADNM_ADDR;
	}
	public String getREFINE_LOTNO_ADDR() {
		return REFINE_LOTNO_ADDR;
	}
	public void setREFINE_LOTNO_ADDR(String rEFINE_LOTNO_ADDR) {
		REFINE_LOTNO_ADDR = rEFINE_LOTNO_ADDR;
	}
	public String getREFINE_ZIP_CD() {
		return REFINE_ZIP_CD;
	}
	public void setREFINE_ZIP_CD(String rEFINE_ZIP_CD) {
		REFINE_ZIP_CD = rEFINE_ZIP_CD;
	}
	public String getJURISD_INST_NM() {
		return JURISD_INST_NM;
	}
	public void setJURISD_INST_NM(String jURISD_INST_NM) {
		JURISD_INST_NM = jURISD_INST_NM;
	}
	public String getIMAGE_COURS() {
		return IMAGE_COURS;
	}
	public void setIMAGE_COURS(String iMAGE_COURS) {
		IMAGE_COURS = iMAGE_COURS;
	}
	public String getSortRegion() {
		return sortRegion;
	}
	public void setSortRegion(String sortRegion) {
		this.sortRegion = sortRegion;
	}
	public String getSortAnimal() {
		return sortAnimal;
	}
	public void setSortAnimal(String sortAnimal) {
		this.sortAnimal = sortAnimal;
	}
	public String getASEQ() {
		return ASEQ;
	}
	public void setASEQ(String aSEQ) {
		ASEQ = aSEQ;
	}
	
	
	
	
}
