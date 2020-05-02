package com.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import front.ICommand;
import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.NoticeDAO;
import com.model.NoticeDTO;

public class NoticeWriteCon implements ICommand {

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
		System.out.println("PostWriteCon 입장");
		String notice_id=request.getParameter("notice_id");
		System.out.println(notice_id);
		String notice_title=request.getParameter("notice_title");
		System.out.println(notice_title);
		String notice_content=request.getParameter("notice_content");
		System.out.println(notice_content);

		
		NoticeDTO dto = new NoticeDTO(notice_id, notice_title, notice_content);
		NoticeDAO dao = new NoticeDAO();
		dao.insertNotice(dto);
		moveURL = "board3.jsp";
		return moveURL;
	}

}
