package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.NoticeDAO;
import com.model.NoticeDTO;

import front.ICommand;

public class BoardNoticeCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String moveURL=null;
		System.out.println("BoardNoticeCon ¿‘¿Â");
		String page=request.getParameter("page_num");
		
		if(page=="1") {
			moveURL="board_notice.jsp";
		}
		moveURL="board_notice.jsp?page_num="+page;
		return moveURL;
	}

}
