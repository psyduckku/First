package com.first.view.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

//@Controller
public class FileUploadController {
	private static final String CURR_IMAGE_REPO_PATH="image/";;
	@RequestMapping(value="/form")
	public String form() {
		System.out.println("form.do접근");
		return "uploadForm.jsp";
	}
	
	@RequestMapping(value="/upload.do",method=RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse resp) throws IOException {
		System.out.println("upload.do접근");
		multipartRequest.setCharacterEncoding("utf-8");
		Map map=new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		//getParameterNames(); 이름집합을 Enumeration 객체로 변환시켜준다.
		while(enu.hasMoreElements()) { //객체가 있는지 확인(boolean)
			String name=(String) enu.nextElement(); //corsor의 위치를 가리킴(0부터)
			String value=multipartRequest.getParameter(name);
			map.put(name, value); //map에 담음
		}
		System.out.println("id찾기:"+map.get("id"));
		
		
		//modelandview로 보낼경우 getboard파일이 리스트에서 getboard하는것돠 겹친다. 그래서 그냥 서버에서 꺼내는게 나을듯?
		List fileList= fileProcess(multipartRequest); //해당 파일의 name을 담음
		map.put("fileList", fileList);  
		ModelAndView mav=new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("uploadResult.jsp");
		return mav;
	}

	private List fileProcess(MultipartHttpServletRequest multipartRequest) throws IOException {
		List<String> fileList=new ArrayList<String>();
		Iterator<String> fileNames=multipartRequest.getFileNames();//file type을 가진 파라미터의 name을 저장함
		while(fileNames.hasNext()) {
			String fileName=fileNames.next();
			MultipartFile mFile=multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename(); //name이 아닌, 파일 자체 이름을 가져옴
			fileList.add(originalFileName); //list에 추가함
			File file=new File(CURR_IMAGE_REPO_PATH+"\\"+fileName); //파일객체 생성(및 경로지정)
			if(mFile.getSize()!=0) { 
				if(! file.exists()) {  // 경로가 없다면 경로를 생성해줌
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+originalFileName));
				//파일을 해당 경로로 업로드해줌. (업로드하지 않으면 임시파일이 자동적으로 삭제됨)
			}
		}
		return fileList;
	}
	
}
