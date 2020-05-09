package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.NoticeDAO;
import com.model.NoticeDTO;

import front.ICommand;

public class CheckLoadCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String moveURL=null;
		System.out.println("CheckLoadCon ¿‘¿Â");
		String[] check_list=request.getParameterValues("check_list[]");
		
		//System.out.println(Arrays.toString(check_list));
		for(String i:check_list) {
			System.out.println(i);
		}
		moveURL="board_load_M.jsp";
		return moveURL;
	}

}
