package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

import front.ICommand;

public class EditCon implements ICommand{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String moveURL = null;
		
		
		String seq = request.getParameter("seq");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String pw = request.getParameter("pw");
//		System.out.println(email);
//		System.out.println(birth);
//		System.out.println(name);
//		System.out.println(phone);
		
		System.out.println("seq"+seq);
		
		
		MemberDTO dto = new MemberDTO(seq, email, pw, birth, name, phone, 0);
		MemberDAO dao = MemberDAO.getDAO();
		int cnt = dao.edit(dto);
		
		if(cnt == 0) {
			moveURL = "user_info.jsp?editsuccess=False";
		}else {
			moveURL = "user_info.jsp";
		}
		
		return moveURL;
	}


}