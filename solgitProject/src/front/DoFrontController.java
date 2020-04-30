package front;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.PostWriteCon;

/**
 * Servlet implementation class DoFrontController
 */
@WebServlet("*.do")
public class DoFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, ICommand> map = new HashMap<String, ICommand>();
	
	private void putData() {
		map.put("dist/PostWriteCon.do", new PostWriteCon());
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("FrontController ¿‘¿Â!");
		String requestURI = request.getRequestURI();
//		System.out.println(requestURI);
		String contextPath = request.getContextPath();
//		System.out.println(contextPath);
		String resultURL = requestURI.substring(contextPath.length() + 1);
//		System.out.println(resultURL);
		String moveURL = null;
		putData();
		ICommand iCommand = map.get(resultURL);
		moveURL = iCommand.execute(request, response);
		
		response.sendRedirect(moveURL);
		
		
		
	}

}
