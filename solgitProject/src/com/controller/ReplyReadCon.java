package com.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import front.ICommand;

import com.google.gson.Gson;
import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.ReplyDAO;
import com.model.ReplyDTO;
import com.model.ReplyDTO;

public class ReplyReadCon implements ICommand {

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
//			System.out.println("성공");
//		}else {
//			System.out.println("실패");
//		}
		System.out.println("ReplyReadCon 입장");
		/*
		 * String reply_id=request.getParameter("reply_id");
		 * System.out.println("reply_id : "+reply_id); int
		 * member_seq=Integer.parseInt(request.getParameter("member_seq"));
		 * System.out.println("member_seq : "+member_seq); String
		 * reply_content=request.getParameter("reply_content");
		 * System.out.println("reply_content:"+reply_content);
		 */
		int board_idx=Integer.parseInt(request.getParameter("board_idx"));
		System.out.println("board_idx : "+board_idx);

		
		//ReplyDTO dto = new ReplyDTO(board_idx);
		ReplyDAO dao = new ReplyDAO();
		//dao.selectReply(board_idx);
		
		Gson gson = new Gson();
		moveURL = gson.toJson(dao.selectReply(board_idx));
		
		return moveURL;
	}

}
