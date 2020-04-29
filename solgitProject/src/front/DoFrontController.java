package front;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ReadPostCon;

/**
 * Servlet implementation class DoFrontController
 */
@WebServlet("*.do")
public class DoFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HashMap<String, ICommand> map = new HashMap<String, ICommand>();
	
	private void putData() {
		map.put("InsertPost", new ReadPostCon());
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
