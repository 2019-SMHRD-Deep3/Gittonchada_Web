package com.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.model.FileDAO;
import com.model.FileDTO;

import front.ICommand;

public class NCheckLoadCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		System.out.println("NCheckLoadCon ¿‘¿Â");
		String[] check_list = request.getParameterValues("check_list[]");
		ArrayList<FileDTO> all_list = new ArrayList<FileDTO>();

		FileDAO dao = new FileDAO();

		// System.out.println(Arrays.toString(check_list));
		for (String i : check_list) {
			int file_seq = Integer.parseInt(i);
			System.out.println("Con" + file_seq);
			int check = dao.setNFile(file_seq);
			System.out.println(check);
		}
		all_list = dao.allFiles();
		System.out.println(all_list);
		Gson gson = new Gson();
		String value = gson.toJson(all_list);
		return value;
	}

}
