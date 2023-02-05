package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	public void init() {
		System.out.println("init 메서드 호출");
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		String user_address = req.getParameter("user_address");
		String user_email= req.getParameter("user_email");
		String user_hp= req.getParameter("user_hp");
		
		String data="안녕하세요<br>로그인하셨습니다.<br><br>";
				data+="<html><body>";
				data+="아이디 : "+ user_id;
				data+="<br>";
				data+="패스워드 : "+ user_pw;
				data+="<br>";
				data+="주소 : "+user_address;
				data+="<br>";
				data+="email : "+user_email;
				data+="<br>";
				data+="핸드폰 : "+user_hp;
				data+="<br>";
				out.print(data);
	}
		public void destroy() {
			System.out.println("destroy메서드 호출");
	}
}
