package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

import front.ICommand;

public class JoinCon implements ICommand{
	
	// ȸ�����Կ� ������ ���� ������ ��� ������ ��ȯ�� ���ؼ� JoinCon ����
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String moveURL = null;
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDTO dto = new MemberDTO(email, pw, birth, name, phone);
		MemberDAO dao = MemberDAO.getDAO();
		int cnt = dao.join(dto);
		
		if(cnt == 0) {
			moveURL = "login.jsp?joinsuccess=False";
		}else {
			moveURL = "mainpage.jsp";
		}
		
		return moveURL;
	}


}