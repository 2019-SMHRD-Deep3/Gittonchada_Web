<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	var str = '';
	var jsonResult;
	$.ajax({
		url : 'http://localhost:9001/re/',
		type : "get",
		dataType : "json",
		success : function(data) {

			var result = JSON.parse(data);

			console.log(result);
			/* 				console.log(result[0]);
			console.log(result[0].future2); */

			/*2일 뒤 예측 SMP*/
			document.write("2일 뒤 예측 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].future2.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")

			/*내일 예측 SMP*/
			document.write("내일 예측 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].future1.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")

			/*오늘 SMP*/
			document.write("오늘 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].present.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")

			/*1일 전 SMP*/
			document.write("1일 전 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].past1.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")

			/*2일 전 SMP*/
			document.write("2일 전 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].past2.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")

			/*3일 전 SMP*/
			document.write("3일 전 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].past3.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")

			/*6일 전 SMP*/
			document.write("6일 전 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].past6.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")

			/*12일 전 SMP*/
			document.write("12일 전 SMP");

			document.write("<table border='1px solid black'>");

			document.write("<tr>");
			for (var i = 0; i < 24; i++) {
				document.write("<th>", i + 1, "시</th>")
			}
			document.write("<th>");
			document.write("최대</th>");
			document.write("<th>");
			document.write("최소</th>");
			document.write("<th>");
			document.write("가중평균</th>");
			document.write("</tr>");

			document.write("<tr>");
			for (var i = 0; i < 27; i++) {
				document.write("<td>", result[i].past12.toFixed(2), "</td>");
			}
			document.write("</tr>");

			document.write("</table>");
			document.write("</br>")
		}
	});
</script>
</head>
<body>
</body>
</html>