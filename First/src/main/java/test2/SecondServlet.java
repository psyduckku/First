package test2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/second")
public class SecondServlet {
		public void init() {
			System.out.println("init 메서드 호출");
		}
		public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			String user_id = req.getParameter("user_id");
			String user_pw = req.getParameter("user_pw");
			String user_address = req.getParameter("user_address");
			
			out.print("<html><body>");
			if(user_id!=null&&user_id.length()!=0) {
				out.print("첫 번째 서블릿에서 넘겨준 아이디: "+user_id +"<br>");
				out.print("첫 번째 서블릿에서 넘겨준 비밀번호 : "+user_pw +"<br>");
				out.print("첫 번째 서블릿에서 넘겨준 주소: "+user_address+"<br>");
				out.print("</body></html>");
			}else {
				System.out.println("로그인 하지 않았습니다.<br><br>");
				System.out.println("다시 로그인하세요!<br>");
				System.out.println("<a href='/biz/testLogin.html'>로그인으로 이동하기</a>");
			}
		}
			public void destroy() {
				System.out.println("destroy메서드 호출");
		}
}

