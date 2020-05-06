package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.ReplyDAO;
import com.model.ReplyDTO;

import front.ICommand;

public class ReplyDeleteCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("ReplyDeleteCon¿‘¿Â");
		int reply_idx = Integer.parseInt(request.getParameter("reply_idx"));
		ReplyDAO dao = new ReplyDAO();
		int board_idx = dao.deleteReply(reply_idx);
		
		ArrayList<ReplyDTO> reply_list=dao.selectReply(board_idx);
		//System.out.println(reply_list.size());
		Gson gson = new Gson();
		String value = gson.toJson(reply_list);
		//System.out.println(value);
		return value;
	}

}
