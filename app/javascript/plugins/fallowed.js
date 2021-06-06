const fallowed = () => {
  Highcharts.getJSON(
  // 'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/usdeur.json',
  function (data) {

    Highcharts.chart('container15', {
      chart: {
        zoomType: 'x'
      },
      title: {
        text: 'Your wallets to USD exchange rate over time'
      },
      subtitle: {
        text: document.ontouchstart === undefined ?
          'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
      },
      xAxis: {
        type: 'datetime'
      },
      yAxis: {
        title: {
          text: 'Exchange rate'
        }
      },
      legend: {
        enabled: false
      },
      plotOptions: {
        area: {
          fillColor: {
            linearGradient: {
              x1: 0,
              y1: 0,
              x2: 0,
              y2: 1
            },
            stops: [
              [0, Highcharts.getOptions().colors[0]],
              [1, Highcharts.color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
            ]
          },
          marker: {
            radius: 2
          },
          lineWidth: 1,
          states: {
            hover: {
              lineWidth: 1
            }
          },
          threshold: null
        }
      },

      series: [{
        type: 'area',
        name: 'USD to EUR',
        // data: ""
      }]
    });
  }
);
      //your code to be executed after 5 second
      var container15 = document.querySelector("#container15");
      var positions = container15.dataset.valueQuantity;
      var times = container15.dataset.time;
      let i = 0;
      while (i < positions.length) {
      charts.series[0].addPoint({
              times,
              positions,
            });
      i += 1;
      }
}
