package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

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

public class ReplyReadCon implements ICommand{

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("UTF-8");

		System.out.println("ReplyReadCon ¿‘¿Â");


		String reply_id = request.getParameter("reply_id");
		String reply_pw = request.getParameter("reply_pw");
		String reply_content = request.getParameter("reply_content");
		int board_idx = Integer.parseInt(request.getParameter("board_idx"));
		System.out.println(reply_id);
		ReplyDTO dto = new ReplyDTO(reply_id, reply_content, board_idx);
		ReplyDAO dao = new ReplyDAO();
		dao.insertReply(dto);
		ArrayList<ReplyDTO> reply_list=dao.selectReply(board_idx);
		//moveURL = "post.jsp";
		Gson gson = new Gson();
		String value = gson.toJson(reply_list);
		System.out.println(value);
		return value;
	}

}
