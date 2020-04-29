package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.PostDAO;
import com.model.PostDTO;

import front.ICommand;

public class ReadPostCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL=null;
//		HttpSession session = request.getSession();
//		MemberDTO info = (MemberDTO)session.getAttribute("info");
//		String post_id = info.getId();
//		String post_title = request.getParameter("post_title");
//		String post_content = request.getParameter("post_content");
//		//String post_result = request.getParameter("post_result");
//		System.out.println(post_id);
//		System.out.println(post_title);
//		System.out.println(post_content);
		//System.out.println( post_result);
//		PostDTO dto = new PostDTO(post_title, post_content, post_id);
//		PostDAO dao = new PostDAO();
//		int cnt = dao.insertPost(dto);
		
//		if (cnt > 0) {
//			System.out.println("성공");
//		}else {
//			System.out.println("실패");
//		}
		moveURL = "community.jsp";
		return moveURL;
	}

}
