// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  
  data: {
    labels: ["1212311", "1시간", "2시간", "3시간", "4시간", "5시간", "6시간", "7시간", "8시간", "9시간", "10시간", "11시간", "12시간"],
    
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
      data: [-18, -15, 23, 5, 10, 12, 13, 15, 40, 25, 24, 15, 10],
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