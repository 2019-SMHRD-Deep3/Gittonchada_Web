package com.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import front.ICommand;
import com.model.BoardDAO;
import com.model.BoardDTO;
import com.model.NoticeDAO;
import com.model.ReplyDAO;
import com.model.ReplyDTO;
import com.model.ReplyDTO;

public class DeleteNoticeCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("UTF-8");

		String moveURL=null;

		System.out.println("DeleteNoticeCon ¿‘¿Â");
		int post_idx=Integer.parseInt(request.getParameter("post_idx"));
		System.out.println(post_idx);

		//BoardDTO dto = new BoardDTO(post_seq);
		NoticeDAO dao = new NoticeDAO();
		dao.deleteNotice(post_idx);
		moveURL = "board_notice.jsp";
		return moveURL;
	}

}
