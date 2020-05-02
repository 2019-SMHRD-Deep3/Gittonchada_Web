package com.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import front.ICommand;
import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.ReplyDAO;
import com.model.ReplyDTO;
import com.model.ReplyDTO;

public class ReplyWriteCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("UTF-8");

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
//			System.out.println("����");
//		}else {
//			System.out.println("����");
//		}
		System.out.println("ReplyWriteCon ����");
		String reply_id=request.getParameter("reply_id");
		System.out.println(reply_id);
		String reply_pw=request.getParameter("reply_pw");
		System.out.println(reply_pw);
		String reply_content=request.getParameter("reply_content");
		System.out.println(reply_content);
		int board_idx=Integer.parseInt(request.getParameter("board_idx"));
		System.out.println(board_idx);

		
		ReplyDTO dto = new ReplyDTO(reply_id, reply_pw, reply_content, board_idx);
		ReplyDAO dao = new ReplyDAO();
		dao.insertReply(dto);
		moveURL = "post.jsp?idx="+board_idx;
		return moveURL;
	}

}