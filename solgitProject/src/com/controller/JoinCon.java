package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

import front.ICommand;

public class JoinCon implements ICommand{
	
	// 회원가입에 성공한 경우와 실패한 경우 페이지 전환을 위해서 JoinCon 구성
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String moveURL = null;
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		System.out.println(email);
		System.out.println(pw);
		System.out.println(birth);
		System.out.println(name);
		System.out.println(phone);
		
		MemberDTO dto = new MemberDTO(email, pw, birth, name, phone, 0);
		MemberDAO dao = MemberDAO.getDAO();
		int cnt = dao.join(dto);
		
		if(cnt == 0) {
			moveURL = "register.jsp?joinsuccess=False";
		}else {
			moveURL = "login.jsp";
		}
		
		return moveURL;
	}


}