package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import front.ICommand;;

public class LogoutCon implements ICommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		HttpSession session = request.getSession();
		session.removeAttribute("info");
		moveURL = "mainpage.jsp";
		return moveURL;
	}

}