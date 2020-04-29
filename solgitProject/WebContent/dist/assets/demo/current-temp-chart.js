// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["0", "1", "2시", "4시", "2시", "1시", "2시", "1시", "2시", "1시", "2시", "1시", "2시"], // time[0]+"시",time[1]+"시",time[2]+"시",time[3]+"시",time[4]+"시",time[5]+"시",time[6]+"시",time[7]+"시",time[8]+"시",time[9]+"시",time[10]+"시",time[11]+"시",time[12]+"시"
    datasets: [{
      label: "기온",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 1,
      data: [0, -5, 0, 5, 10, 12, 13, 15, 20, 25, 24, 15, 10],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: '시간'
        },
        gridLines: {
          display: true
        },
        ticks: {
          maxTicksLimit: 13
        }
      }],
      yAxes: [{
        ticks: {
          min: -20,
          max: 40,
          maxTicksLimit: 10
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: true
    }
  }
});
