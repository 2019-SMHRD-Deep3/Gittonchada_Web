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

							// index 시간출력
							index = 0;

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
							var hourly_clouds = parseInt(oneCall.hourly[index].clouds / 10);

							// 풍속
							var hourly_wind_speed = oneCall.hourly[index].wind_speed;

							// 풍향
							var hourly_wind_deg = oneCall.hourly[index].wind_deg;

							// 강수량
							var hourly_rain;
							if (oneCall.hourly[index].rain != null) {
								hourly_rain = oneCall.hourly[index].rain;
							} else {
								hourly_rain = 0;
							}

							// 적설량
							var hourly_snow;
							if (oneCall.hourly[index].snow != null) {
								hourly_snow = oneCall.hourly[index].snow;
							} else {
								hourly_snow = 0;
							}

							// 일사량
							var solar_radiation = 0;

							// 일조량
							var solar_sunshine = 0;

							// 발전량
							var generation = 0;

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
											solar_radiation = rs.solar_radiation;
											solar_sunshine = rs.solar_sunshine;
											solar_generation = rs.solar_generation;

											document
													.write('<div class="hourly">');
											document.write('<div>현재 시간 : ',
													hourly_dt, '</div>');
											document.write('<div>현재 날씨 : ',
													hourly_weather);
											document
													.write('<img src = "http://openweathermap.org/img/wn/' + hourly_wIcon + '.png"/></div>');
											document.write('<div>기온 : ',
													hourly_temp, '℃</div>');
											document.write('<div>체감 온도 : ',
													hourly_feels_like,
													'℃</div>');
											document.write('<div>기압 : ',
													hourly_pressure,
													'hpa</div>');
											document.write('<div>습도 : ',
													hourly_humidity, '%</div>');
											document
													.write('<div>이슬점 : ',
															hourly_dew_point,
															'℃</div>');
											document.write('<div>운량 : ',
													hourly_clouds, '%</div>');
											document.write('<div>풍속 : ',
													hourly_wind_speed,
													'm/s</div>');
											document.write('<div>풍향 : ',
													hourly_wind_deg, '</div>');
											document.write('<div>강수량 : ',
													hourly_rain, 'mm</div>');
											document.write('<div>적설량 : ',
													hourly_snow, 'mm</div>');
											document.write('<div>일사량 : ',
													solar_radiation.toFixed(2),
													'MJ/m2</div>');
											document.write('<div>일조량 : ',
													solar_sunshine.toFixed(2), 'hr</div>');
											document.write('<div>예상 발전량 : ',
													solar_generation.toFixed(2), 'kWh</div>');
											document.write('</div></br></br>');

										}
									});
						});
	</script>
</body>

</html>