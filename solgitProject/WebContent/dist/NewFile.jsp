<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%BoardDAO dao = new BoardDAO();
ArrayList<BoardDTO> list=dao.selectPost();

System.out.println(list.get(0).getBoard_id());%>
</body>
</html>