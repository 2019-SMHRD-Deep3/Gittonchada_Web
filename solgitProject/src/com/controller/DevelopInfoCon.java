package com.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.model.FileDAO;
import com.model.FileDTO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import front.ICommand;

public class DevelopInfoCon implements ICommand{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL=null;
		
		FileDAO dao = new FileDAO();
		FileDTO dto = null;
		
		ServletContext context = request.getServletContext();
		String file_path = context.getRealPath("file_load");
		System.out.println("파일저장경로"+file_path);
		int maxSize=3*1024*1024;
		String encoding="utf-8";
		String local1=null;
		String local2=null;
		String file_name=null;
		int member_seq;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, file_path, maxSize, encoding, new DefaultFileRenamePolicy());
			local1=multi.getParameter("sido");
			local2=multi.getParameter("gugun");
			member_seq=Integer.parseInt(multi.getParameter("info"));
			file_name=multi.getFilesystemName("file_name");
			String local=local1+"-"+local2;
			System.out.println(member_seq);
			dto = new FileDTO(file_name, local, member_seq);
			dao.insertFile(dto);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println(local1);
		//System.out.println(local2);
		//System.out.println(file_name);
		//System.out.println(member_seq);
		moveURL="board_load.jsp";
		return moveURL;
	}

}
