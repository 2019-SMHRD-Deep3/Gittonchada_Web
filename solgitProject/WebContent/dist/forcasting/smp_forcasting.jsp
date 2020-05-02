<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
				console.log(result[0]);
				console.log(result[0].future2);
			}
		});
	</script>
</body>
</html>