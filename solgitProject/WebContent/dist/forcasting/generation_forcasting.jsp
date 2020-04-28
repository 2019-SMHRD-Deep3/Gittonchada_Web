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

							// index �ð����
							index = 0;

							// �ð�
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

							// ����
							var hourly_weather = oneCall.hourly[index].weather[0].description;

							// ���� ������
							var hourly_wIcon = oneCall.hourly[index].weather[0].icon;

							// ���� ���
							var hourly_temp = oneCall.hourly[index].temp;

							// ü�� ���
							var hourly_feels_like = oneCall.hourly[index].feels_like;

							// ���
							var hourly_pressure = oneCall.hourly[index].pressure;

							// ����
							var hourly_humidity = oneCall.hourly[index].humidity;

							// �̽���
							var hourly_dew_point = oneCall.hourly[index].dew_point;

							// �
							var hourly_clouds = parseInt(oneCall.hourly[index].clouds / 10);

							// ǳ��
							var hourly_wind_speed = oneCall.hourly[index].wind_speed;

							// ǳ��
							var hourly_wind_deg = oneCall.hourly[index].wind_deg;

							// ������
							var hourly_rain;
							if (oneCall.hourly[index].rain != null) {
								hourly_rain = oneCall.hourly[index].rain;
							} else {
								hourly_rain = 0;
							}

							// ������
							var hourly_snow;
							if (oneCall.hourly[index].snow != null) {
								hourly_snow = oneCall.hourly[index].snow;
							} else {
								hourly_snow = 0;
							}

							// �ϻ緮
							var solar_radiation = 0;

							// ������
							var solar_sunshine = 0;

							// ������
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
											document.write('<div>���� �ð� : ',
													hourly_dt, '</div>');
											document.write('<div>���� ���� : ',
													hourly_weather);
											document
													.write('<img src = "http://openweathermap.org/img/wn/' + hourly_wIcon + '.png"/></div>');
											document.write('<div>��� : ',
													hourly_temp, '��</div>');
											document.write('<div>ü�� �µ� : ',
													hourly_feels_like,
													'��</div>');
											document.write('<div>��� : ',
													hourly_pressure,
													'hpa</div>');
											document.write('<div>���� : ',
													hourly_humidity, '%</div>');
											document
													.write('<div>�̽��� : ',
															hourly_dew_point,
															'��</div>');
											document.write('<div>� : ',
													hourly_clouds, '%</div>');
											document.write('<div>ǳ�� : ',
													hourly_wind_speed,
													'm/s</div>');
											document.write('<div>ǳ�� : ',
													hourly_wind_deg, '</div>');
											document.write('<div>������ : ',
													hourly_rain, 'mm</div>');
											document.write('<div>������ : ',
													hourly_snow, 'mm</div>');
											document.write('<div>�ϻ緮 : ',
													solar_radiation.toFixed(2),
													'MJ/m2</div>');
											document.write('<div>������ : ',
													solar_sunshine.toFixed(2), 'hr</div>');
											document.write('<div>���� ������ : ',
													solar_generation.toFixed(2), 'kWh</div>');
											document.write('</div></br></br>');

										}
									});
						});
	</script>
</body>

</html>