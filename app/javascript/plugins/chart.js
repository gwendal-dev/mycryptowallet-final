
var Highcharts = require('highcharts');
require('highcharts/highcharts');
require('highcharts/modules/exporting')(Highcharts);
// Create the chart
require('highcharts/modules/export-data')(Highcharts);
require('highcharts/modules/accessibility')(Highcharts);

const chart = () => {
  let i = 0;
  const container = document.querySelector('#container');
        // Make monochrome colors
  var pieColors = (function () {
      var colors = [],
          base = Highcharts.getOptions().colors[0],
          i;

      for (i = 0; i < 10; i += 1) {
          // Start out with a darkened base color (negative brighten), and end
          // up with a much brighter color
          colors.push(Highcharts.color(base).brighten((i - 3) / 7).get());
      }
      return colors;
  }());
  // Build the chart
  Highcharts.chart('container', {
      chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          type: 'pie'
      },
      title: {
          text: 'MY Crypto Wallet'
      },
      tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      },
      accessibility: {
          point: {
              valueSuffix: '%'
          }
      },
      plotOptions: {
          pie: {
              allowPointSelect: true,
              cursor: 'pointer',
              colors: pieColors,
              dataLabels: {
                  enabled: true,
                  format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                  distance: -50,
                  filter: {
                      property: 'percentage',
                      operator: '>',
                      value: 4
                  }
              }
          }
      },
      series: [{
          innerSize: '60%',
          name: 'Share',
          data: [
              // { name: JSON.parse(container.dataset.coins)[JSON.parse(container.dataset.positions)[0].coin_id - 1].title, y: JSON.parse(container.dataset.positions)[0].quantity * JSON.parse(container.dataset.coins)[JSON.parse(container.dataset.positions)[0].coin_id - 1].price },
              // { name: JSON.parse(container.dataset.coins)[JSON.parse(container.dataset.positions)[1].coin_id - 1].title, y: JSON.parse(container.dataset.positions)[1].quantity * JSON.parse(container.dataset.coins)[JSON.parse(container.dataset.positions)[1].coin_id - 1].price },
              { name: 'ETH', y: 20},
              { name: 'ADA', y: 5},
              { name: 'BNB', y: 10},
              { name: 'other', y: 10}
          ]
      }]
  });
}

export {chart}
