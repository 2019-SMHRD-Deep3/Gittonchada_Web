package front;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.JoinCon;
import com.controller.LoginCon;


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
		// map.put("InsertPost", new ReadPostCon());
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("FrontController ¿‘¿Â!");
		
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		String resultURL = requestURI.substring(contextPath.length() + 6);
		System.out.println(resultURL);
		String moveURL = null;
		
		putData();
		ICommand iCommand = map.get(resultURL);
		System.out.println(iCommand);
		System.out.println(resultURL);
		moveURL = "/dist/"+iCommand.execute(request, response);
		
		
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
