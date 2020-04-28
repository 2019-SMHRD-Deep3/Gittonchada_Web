<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>

<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
<style type="text/css">
.hourly {
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<script>
		$
				.getJSON(
						'https://api.openweathermap.org/data/2.5/onecall?lat=37.57&lon=126.98&appid=dbf3abee8d29ca1bd9cefa8675b55c52&units=metric',
						function(oneCall) {
							// Hourly Weather Data
							for (var index = 0; index < oneCall.hourly.length; index++) {
								// 시간
								var hourly_time = oneCall.hourly[index].dt;
								var hourly_now = new Date(hourly_time * 1000);
								var hourly_dt = hourly_now.getFullYear() + "-"
										+ (hourly_now.getMonth() + 1) + "-"
										+ hourly_now.getDate() + " "
										+ hourly_now.getHours() + ":"
										+ hourly_now.getMinutes() + " ";
								var hourly_month = hourly_now.getMonth() + 1;
								var hourly_day = hourly_now.getDate();
								var hourly_time = hourly_now.getHours();

								// 날씨
								var hourly_weather = oneCall.hourly[index].weather[0].description;

								// 날씨 아이콘
								var hourly_wIcon = oneCall.hourly[index].weather[0].icon;

								// 현재 기온
								var hourly_temp = oneCall.hourly[index].temp;

								// 체감 기온
								var hourly_feels_like = oneCall.hourly[index].feels_like;

								// 기압
								var hourly_pressure = oneCall.hourly[index].pressure;

								// 습도
								var hourly_humidity = oneCall.hourly[index].humidity;

								// 이슬점
								var hourly_dew_point = oneCall.hourly[index].dew_point;

								// 운량
								var hourly_clouds = oneCall.hourly[index].clouds;

								// 풍속
								var hourly_wind_speed = oneCall.hourly[index].wind_speed;

								// 풍향
								var hourly_wind_deg = oneCall.hourly[index].wind_deg;

								$
										.ajax({
											url : "http://localhost:9000/re/"
													+ hourly_month + "/"
													+ hourly_day + "/"
													+ hourly_time + "/"
													+ hourly_temp + "/"
													+ hourly_rain + "/"
													+ hourly_wind_speed + "/"
													+ hourly_wind_deg + "/"
													+ hourly_humidity + "/"
													+ hourly_clouds,
											method : "POST",
											success : function(rs) {

												if (rs.result1 == 1) {
													$('#result1').text(
															'#명동, 남대문, 북창');
													$('#result1').attr('style',
															"display:inline");
													url1 = 'K_MD.jsp?act='
															+ act;
													$('#result1').on('click',
															popupPage1);
												}
												if (rs.result2 == 1) {
													$('#result2')
															.text(
																	'#이태원(이태원세계음식거리, 한남동)');
													$('#result2').attr('style',
															"display:inline");
													url2 = 'Main.html?act='
															+ act;
													$('#result2').on('click',
															popupPage2);
												}
												if (rs.result3 == 1) {
													$('#result3').text(
															'#동대문 패션타운');
													$('#result3').attr('style',
															"display:inline");
													url3 = 'K_Dongdaemun.jsp?act='
															+ act;
													$('#result3').on('click',
															popupPage3);
												}
												if (rs.result4 == 1) {
													$('#result4').text(
															'#종로, 청계');
													$('#result4').attr('style',
															"display:inline");
													url4 = 'K_Jong-ro.jsp?act='
															+ act;
													$('#result4').on('click',
															popupPage4);
												}
												if (rs.result5 == 1) {
													$('#result5').text('#잠실');
													$('#result5').attr('style',
															"display:inline");
													url5 = 'Main.html?act='
															+ act;
													$('#result5').on('click',
															popupPage5);
												}
												if (rs.result6 == 1) {
													$('#result6').text('#코엑스');
													$('#result6').attr('style',
															"display:inline");
													url6 = 'Main.html?act='
															+ act
													$('#result6').on('click',
															popupPage6);
												}
												if (rs.result7 == 1) {
													$('#result7').text(
															'#여의도(63빌딩)');
													$('#result7').attr('style',
															"display:inline");
													url7 = 'Main.html?act='
															+ act
													$('#result7').on('click',
															popupPage7);
												}
												if (rs.result8 == 1) {
													$('#result8').text(
															'#한강, 유람선');
													$('#result8').attr('style',
															"display:inline");
													url8 = 'Main.html?act='
															+ act
													$('#result8').on('click',
															popupPage8);
												}
												if (rs.result9 == 1) {
													$('#result9').text(
															'#광화문 광장');
													$('#result9').attr('style',
															"display:inline");
													url9 = 'Main.html?act='
															+ act
													$('#result9').on('click',
															popupPage9);
												}
												if (rs.result10 == 1) {
													$('#result10').text(
															'#신촌, 홍대주변');
													$('#result10').attr(
															'style',
															"display:inline");
													url10 = 'Main.html?act='
															+ act
													$('#result10').on('click',
															popupPage10);
												}
												if (rs.result11 == 1) {
													$('#result11').text(
															'#DMC, 월드컵경기장');
													$('#result11').attr(
															'style',
															"display:inline");
													url11 = 'Main.html?act='
															+ act
													$('#result11').on('click',
															popupPage11);
												}
												if (rs.result12 == 1) {
													$('#result12').text(
															'#청담동, 압구정동');
													$('#result12').attr(
															'style',
															"display:inline");
													url12 = 'Main.html?act='
															+ act
													$('#result12').on('click',
															popupPage12);
												}
												if (rs.result13 == 1) {
													$('#result13')
															.text('#가로수길');
													$('#result13').attr(
															'style',
															"display:inline");
													url13 = 'Main.html?act='
															+ act
													$('#result13').on('click',
															popupPage13);
												}
												if (rs.result14 == 1) {
													$('#result14').text('#강남역');
													$('#result14').attr(
															'style',
															"display:inline");
													url14 = 'Main.html?act='
															+ act
													$('#result13').on('click',
															popupPage14);
													//$('#result14').attr('onclick', "location='"+url14+ "'" );
												}

												$('#seoul')
														.attr('style',
																"margin: auto; text-align: center;");
											}
										});

								document.write('<div class="hourly">');
								document.write('<div>현재 시간 : ', hourly_dt,
										'</div>');
								document.write('<div>현재 날씨 : ', hourly_weather);
								document
										.write('<img src = "http://openweathermap.org/img/wn/' + hourly_wIcon + '.png"/></div>');
								document.write('<div>기온 : ', hourly_temp,
										'℃</div>');
								document.write('<div>체감 온도 : ',
										hourly_feels_like, '℃</div>');
								document.write('<div>기압 : ', hourly_pressure,
										'hpa</div>');
								document.write('<div>습도 : ', hourly_humidity,
										'%</div>');
								document.write('<div>이슬점 : ', hourly_dew_point,
										'℃</div>');
								document.write('<div>운량 : ', hourly_clouds,
										'%</div>');
								document.write('<div>풍속 : ', hourly_wind_speed,
										'm/s</div>');
								document.write('<div>풍향 : ', hourly_wind_deg,
										'</div>');
								document.write('</div></br></br>');
							}
						});
	</script>
</body>

</html>