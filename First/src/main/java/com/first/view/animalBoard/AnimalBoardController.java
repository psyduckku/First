package com.first.view.animalBoard;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.exc.StreamWriteException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.first.biz.animalBoard.AnimalBoardService;
import com.first.biz.animalBoard.AnimalBoardVO;

@Controller
public class AnimalBoardController {

	@Autowired
	AnimalBoardService animalBoardService;
	
	@RequestMapping(value="/getAsideList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getDdayList(AnimalBoardVO vo) throws StreamWriteException, DatabindException, IOException {
		System.out.println("getAsideList.do 접근");
		
		List<AnimalBoardVO> list = animalBoardService.getAsideList(vo);
		ObjectMapper objectMapper = new ObjectMapper();
		String stringList = objectMapper.writeValueAsString(list);
		System.out.println("stringList ::"+stringList);
		
		return stringList;
	}

	@RequestMapping(value="/getAnimal.do")
	public String getBoard(Model model, AnimalBoardVO vo) {
		System.out.println("getAnimal.do 접근");
		System.out.println("aseq : "+vo.getASEQ());
		model.addAttribute("info", animalBoardService.getAnimal(vo));
		
		return "getAnimalBoard.jsp";
		
	}

	@RequestMapping(value="/getAnimalList.do")
	public String searchList(Model model, AnimalBoardVO vo, HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("getAnimalList.do 접근");
		
		// mybatis null 인식문제로 value부여하여 처리!
		if(vo.getSortRegion()==null) {
			vo.setSortRegion("지역선택");
		}
		if(vo.getSortAnimal()==null) {
			vo.setSortAnimal("동물선택");
		}
		
		System.out.println("동물분류:"+vo.getSortAnimal());
		System.out.println("지역분류:"+vo.getSortRegion());
		
		model.addAttribute("list", animalBoardService.getAnimalList(vo));
		
		 
		return "animalList.jsp";
	}
	
	
	// 검색 조건 목록 설정
	@ModelAttribute("sortRegion")
	public Map<String, String> sortRegion(){
		Map<String, String> sortRegion = new LinkedHashMap<String, String>();
		sortRegion.put("지역선택", "지역선택");
		sortRegion.put("가평군", "41820");	sortRegion.put("경기도", "41000");
		sortRegion.put("고양시", "41280");	sortRegion.put("과천시", "41290");
		sortRegion.put("광명시", "41210");	sortRegion.put("광주시", "41610");
		sortRegion.put("구리시", "41310");	sortRegion.put("군포시", "41410");
		sortRegion.put("김포시", "41570");	sortRegion.put("남양주시", "41360");
		sortRegion.put("동두천시", "41250");	sortRegion.put("성남시", "41130");
		sortRegion.put("수원시", "41110");	sortRegion.put("시흥시", "41390");
		sortRegion.put("안산시", "41270");	sortRegion.put("안성시", "41550");
		sortRegion.put("안양시", "41170");	sortRegion.put("양주시", "41630");
		sortRegion.put("양평군", "41830");	sortRegion.put("여주시", "41670");
		sortRegion.put("연천군", "41800");   sortRegion.put("오산시", "41370");		
		sortRegion.put("용인시", "41460");	sortRegion.put("의왕시", "41430");
		sortRegion.put("의정부시", "41150");	sortRegion.put("이천시", "41500");
		sortRegion.put("파주시", "41480");	sortRegion.put("평택시", "41220");
		sortRegion.put("포천시", "41650");	sortRegion.put("하남시", "41450");
		sortRegion.put("화성시", "41590");
		return sortRegion;
	}
	@ModelAttribute("sortSpecies")
	public Map<String, String> sortSpecies(){
		Map<String, String> sortSpecies = new LinkedHashMap<String, String>();
		sortSpecies.put("동물선택", "동물선택");
		sortSpecies.put("개", "개");
		sortSpecies.put("고양이", "고양이");
		sortSpecies.put("기타축종", "기타축종");
		return sortSpecies;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertAnimal.do", method=RequestMethod.POST)
	public String insertAnimal(@RequestParam HashMap<Object, Object> param, AnimalBoardVO vo) {
		//RequestParam은 클라이언트가 요청한 쿼리 파라메터에 대한 값을 binding해준다. 스프링에서 default는 GET으로 
		//받을 경우에 사용하지만, 클라이언트에서 post로 요청(HTML Form이나, ajax의 method:post일경우
		// RequestParam 값을 받을 수 있다.
		
		System.out.println("insertAnimal");
		
		//.toString()
		JSONArray array = new JSONArray(param.get("target").toString()); //json배열
		
		if(array.length()>0) {
			for(int i=0; i<array.length();i++) {
				vo.setSIGUN_CD((String) array.getJSONObject(i).get("SIGUN_CD"));
				vo.setSIGUN_NM((String) array.getJSONObject(i).get("SIGUN_NM"));
				vo.setABDM_IDNTFY_NO((String) array.getJSONObject(i).get("ABDM_IDNTFY_NO"));
				vo.setRECEPT_DE((String)array.getJSONObject(i).get("RECEPT_DE"));
				vo.setDISCVRY_PLC_INFO((String)array.getJSONObject(i).get("DISCVRY_PLC_INFO"));
				vo.setSTATE_NM((String)array.getJSONObject(i).get("STATE_NM"));
				vo.setPBLANC_IDNTFY_NO((String)array.getJSONObject(i).get("PBLANC_IDNTFY_NO"));
				vo.setPBLANC_BEGIN_DE((String)array.getJSONObject(i).get("PBLANC_BEGIN_DE"));
				vo.setPBLANC_END_DE((String)array.getJSONObject(i).get("PBLANC_END_DE"));
				vo.setSPECIES_NM((String)array.getJSONObject(i).get("SPECIES_NM"));
				vo.setCOLOR_NM((String) array.getJSONObject(i).get("COLOR_NM"));
				vo.setAGE_INFO((String)array.getJSONObject(i).get("AGE_INFO"));
				vo.setBDWGH_INFO((String)array.getJSONObject(i).get("BDWGH_INFO"));
				vo.setSEX_NM((String) array.getJSONObject(i).get("SEX_NM"));
				vo.setNEUT_YN((String) array.getJSONObject(i).get("NEUT_YN"));
				vo.setSFETR_INFO((String) array.getJSONObject(i).get("SFETR_INFO"));
				vo.setSHTER_NM((String) array.getJSONObject(i).get("SHTER_NM"));
				vo.setSHTER_TELNO((String) array.getJSONObject(i).get("SHTER_TELNO"));
				vo.setPROTECT_PLC((String) array.getJSONObject(i).get("PROTECT_PLC"));
				vo.setREFINE_ROADNM_ADDR((String) array.getJSONObject(i).get("REFINE_ROADNM_ADDR"));
				vo.setREFINE_LOTNO_ADDR((String) array.getJSONObject(i).get("REFINE_LOTNO_ADDR"));
				vo.setREFINE_ZIP_CD((String)array.getJSONObject(i).get("REFINE_ZIP_CD"));
				vo.setJURISD_INST_NM((String) array.getJSONObject(i).get("JURISD_INST_NM"));
				vo.setIMAGE_COURS((String) array.getJSONObject(i).get("IMAGE_COURS"));
				System.out.println(vo.toString());
				System.out.println(i);
				animalBoardService.insertAnimal(vo);
				System.out.println(vo.toString());
			}
			System.out.println("명단 setter완료");
		}
		return null;
	}
		
	
	
}
