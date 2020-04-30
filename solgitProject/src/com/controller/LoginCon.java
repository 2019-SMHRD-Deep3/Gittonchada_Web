package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

import front.ICommand;

public class LoginCon implements ICommand {

	// �α��ο� ������ ���� ������ ��� ������ ��ȯ�� ���ؼ� LoginCon ����
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
	   
		// response.setCharacterEncoding("EUC-KR");
		// request.setCharacterEncoding("EUC-KR");
		// String[] item = request.getParameterValues("item");
		// int num = Integer.parseInt(request.getParameter("num"));
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		// System.out.println(email);
		// System.out.println(pw);

		MemberDTO dto = new MemberDTO(email, pw);
		MemberDAO dao = MemberDAO.getDAO();
		MemberDTO info = dao.login(dto);
		
		if (info != null) {
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
		}
		
		if (request.getParameter("email") != null) {
			moveURL = "mainpage.jsp";
		}else {
			moveURL = "login.jsp?success=False";
		}

		return moveURL;

	}

}
