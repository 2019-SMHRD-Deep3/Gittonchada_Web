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

public class DeletePostCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("UTF-8");

		String moveURL=null;

		System.out.println("DeletePostCon ¿‘¿Â");
		int post_seq=Integer.parseInt(request.getParameter("post_seq"));
		System.out.println(post_seq);

		//BoardDTO dto = new BoardDTO(post_seq);
		BoardDAO dao = new BoardDAO();
		dao.deletePost(post_seq);
		moveURL = "board_community.jsp";
		return moveURL;
	}

}
