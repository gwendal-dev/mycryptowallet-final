
var Highcharts = require('highcharts');
require('highcharts/highcharts');
require('highcharts/modules/exporting')(Highcharts);
// Create the chart
require('highcharts/modules/export-data')(Highcharts);
require('highcharts/modules/accessibility')(Highcharts);

const stat = () => {
  if (document.querySelector("#container12") != null) {

  const container = document.querySelector('#container12');
  // Create the chart
let charts = Highcharts.chart('container12', {
  chart: {
    type: 'column'
  },
  title: {
    text: 'MyCryptoWallet'
  },
  subtitle: {
    text: ''
  },
  accessibility: {
    announceNewData: {
      enabled: true
    }
  },
  xAxis: {
    type: 'Coins'
  },
  yAxis: {
    title: {
      text: 'Total'
    }

  },
  legend: {
    enabled: false
  },
  plotOptions: {
    series: {
      borderWidth: 0,
      dataLabels: {
        enabled: true,
        format: '{point.y:.1f}$'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
  },

  series: [
    {
      colorByPoint: true,
    }
  ],
});
let j = 0;

if (container.dataset.coins != "null") {
    while (JSON.parse(container.dataset.coins)[j] != null) {
    if (JSON.parse(container.dataset.coins)[j].quantity > 0) {
      charts.series[0].addPoint({
        name: JSON.parse(container.dataset.coins)[j].title,
        y: JSON.parse(container.dataset.result)[j]
      });
    }
      j += 1;
    }
  }
}
}

export {stat}
