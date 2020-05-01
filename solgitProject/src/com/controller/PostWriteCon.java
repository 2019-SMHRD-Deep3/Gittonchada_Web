package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import front.ICommand;
import com.model.BoardDAO;
import com.model.BoardDTO;

public class PostWriteCon implements ICommand {

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
		System.out.println("PostWriteCon 입장");
		String board_id=request.getParameter("board_id");
		System.out.println(board_id);
		String board_pw=request.getParameter("board_pw");
		System.out.println(board_pw);
		String board_title=request.getParameter("board_title");
		System.out.println(board_title);
		String board_content=request.getParameter("board_content");
		System.out.println(board_content);
		String board_lock=request.getParameter("board_lock");
		System.out.println(board_lock);
		
		BoardDTO dto = new BoardDTO(board_id, board_pw, board_title, board_content, board_lock);
		BoardDAO dao = new BoardDAO();
		dao.insertPost(dto);
		moveURL = "board2.jsp";
		return moveURL;
	}

}
