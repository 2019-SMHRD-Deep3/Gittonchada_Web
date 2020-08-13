package front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.BoardCommuCon;
import com.controller.BoardLoadCon;
import com.controller.BoardNoticeCon;
import com.controller.CheckLoadCon;
import com.controller.DeleteNoticeCon;
import com.controller.DeletePostCon;
import com.controller.DevelopInfoCon;
import com.controller.EditCon;
import com.controller.JoinCon;
import com.controller.LoginCon;
import com.controller.LogoutCon;
import com.controller.NCheckLoadCon;
import com.controller.NoticeWriteCon;
import com.controller.PostWriteCon;
import com.controller.ReplyDeleteCon;
import com.controller.ReplyReadCon;
import com.controller.ReplyWriteCon;

/**
 * Servlet implementation class DoFrontController
 */
@WebServlet("*.do")
public class DoFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, ICommand> map = new HashMap<String, ICommand>();
	
	private void putData() {
		map.put("LoginService.do", new LoginCon());
		map.put("JoinService.do", new JoinCon());
		map.put("EditService.do", new EditCon());
		map.put("LogoutService.do", new LogoutCon());
		map.put("PostWriteCon.do", new PostWriteCon());
		map.put("NoticeWriteCon.do", new NoticeWriteCon());
		map.put("ReplyWriteCon.do", new ReplyWriteCon());
		map.put("ReplyReadCon.do", new ReplyReadCon());
		map.put("DevelopInfoCon.do", new DevelopInfoCon());
		map.put("BoardNoticeCon.do", new BoardNoticeCon());
		map.put("BoardCommuCon.do", new BoardCommuCon());
		map.put("BoardLoadCon.do", new BoardLoadCon());
		map.put("ReplyDeleteCon.do", new ReplyDeleteCon());
		map.put("CheckLoadCon.do", new CheckLoadCon());
		map.put("NCheckLoadCon.do", new NCheckLoadCon());
		map.put("DeletePostCon.do", new DeletePostCon());
		map.put("DeleteNoticeCon.do", new DeleteNoticeCon());
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		System.out.println("FrontController ¿‘¿Â!");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String resultURL = requestURI.substring(contextPath.length() + 6);
		String moveURL = null;
		System.out.println(resultURL);
		putData();
		ICommand iCommand = map.get(resultURL);
		
		moveURL = iCommand.execute(request, response);
		if(resultURL.equals("CheckLoadCon.do")) {
			out.print(moveURL);
			return;
		}
		if(resultURL.equals("NCheckLoadCon.do")) {
			out.print(moveURL);
			return;
		}
		if(resultURL.equals("ReplyDeleteCon.do")) {
			out.print(moveURL);
			//System.out.println(moveURL);
			return;
		}
		if(resultURL.equals("ReplyWriteCon.do")) {
			out.print(moveURL);
			System.out.println(moveURL);
			return;
		}
		if(resultURL.equals("ReplyReadCon.do")) {
			out.print(moveURL);
			System.out.println(moveURL);
			return;
		}
//		if(iCommand instanceof LoginCon) {
//            response.getWriter().print(moveURL);
//         }else {
//            moveURL = iCommand.execute(request, response);
//            response.sendRedirect(moveURL);
//         }
		
//		if(resultURL.equals("ReadPost.do")) {
//			response.getWriter().print(moveURL);
//			return;
//		}
//		if(resultURL.equals("ReadReply.do")) {
//			response.getWriter().print(moveURL);
//			return;
//		}
//		if(resultURL.equals("InsertReply.do")) {
//			response.getWriter().print(moveURL);
//			return;
//		}
		
		if(!(moveURL==null))
			response.sendRedirect(moveURL);
	}
	

}
