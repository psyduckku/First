package com.first.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.first.biz.user.UserService;
import com.first.biz.user.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/getUser.do", method=RequestMethod.POST)
	public String getUser(UserVO vo, HttpSession session, Model model) {
		System.out.println("getUser실행");
		UserVO loginUser= userService.getUser(vo);
		
		if(loginUser==null) {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			model.addAttribute("url", "login.jsp");
			return "alert.jsp";
		}else {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("ID", loginUser.getId());
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("url", "index.jsp");
			System.out.println("-----최초 세션 생성시각 : "+ session.getCreationTime());
			System.out.println("-----최근 세션 접근시각 : "+ session.getLastAccessedTime());
			System.out.println("-----세션 유효시간 : " + session.getMaxInactiveInterval());
			
			return "alert.jsp";
		}
	}
	
	@RequestMapping("/logoutUser.do")
	public String logoutUser(UserVO vo, HttpSession session, Model model) {
		System.out.println("logoutUser.do 접근");
		String id = (String) session.getId();
		if(id!=null) {
			session.invalidate();
			System.out.println("invalidate");
			model.addAttribute("msg", "로그아웃 완료.");
			model.addAttribute("url", "index.jsp");
		}else {
			model.addAttribute("msg", "로그아웃 실패.");
			model.addAttribute("url", "index.jsp");
			System.out.println("로그아웃 실패");
		}
		return "alert.jsp";
	}
	
	@RequestMapping("/insertUser.do")
	public String insertUsers(UserVO vo, HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		String pswd = req.getParameter("pswd");
		String name = req.getParameter("name");
		String nick = req.getParameter("nick");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		System.out.println("id: "+id+"pswd: "+pswd+"nick: "+nick+"name: "+name+"phone: "+phone+"addr: "+addr);
		vo.setId(id); vo.setPswd(pswd); vo.setName(name); vo.setNick(nick); vo.setPhone(phone); vo.setAddr(addr);
		userService.insertUser(vo);
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		model.addAttribute("url", "login.jsp");
		return "alert.jsp";
	}
	
	@RequestMapping("/getMyInfo.do")
	public String getMyinfo(UserVO vo, Model model, HttpSession session) {
		System.out.println("getMyInfo.do접근");
		String id = (String) session.getAttribute("ID");
		System.out.println("myinfo아이디  : "+id);
		vo.setId(id);
		
		model.addAttribute("myInfo", userService.getMyInfo(vo));
		return "myPage.jsp";
	}
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo, HttpServletRequest req, Model model, HttpSession session) {
		System.out.println("/updateUser.do접근");
		String id = req.getParameter("id");
		String pswd = req.getParameter("pswd");
		String name = req.getParameter("name");
		String nick = req.getParameter("nick");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		System.out.println("id: "+id+"pswd: "+pswd+"nick: "+nick+"name: "+name+"phone: "+phone+"addr: "+addr);
		vo.setId(id); vo.setPswd(pswd); vo.setName(name); vo.setNick(nick); vo.setPhone(phone); vo.setAddr(addr);
		userService.updateUser(vo);
		model.addAttribute("msg", "회원정보가 수정되었습니다.");
		model.addAttribute("url", "login.jsp");
		return "alert.jsp";
	}
}
