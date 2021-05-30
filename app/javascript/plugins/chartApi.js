var Highcharts = require('highcharts');
require('highcharts/highcharts');
require('highcharts/modules/exporting')(Highcharts);
// Create the chart
require('highcharts/modules/export-data')(Highcharts);
require('highcharts/modules/accessibility')(Highcharts);

const chartApi = () => {

  const ccxt = require ('ccxt');
  let sum = 0;
  let i = 0;
  let k = 0;
  let coins = {};
  let EXCHANGE = 0;

if (document.querySelector(".container5") != null || document.querySelector(".api") != null) {

const create = (async function () {
    const exchangeId = 'binance'
        , exchangeClass = ccxt[exchangeId]
        , exchange = new exchangeClass ({
            'apiKey': process.env.KEY.toString(),
            'secret': process.env.SECRETKEY.toString(),
            'timeout': 30000,
            'enableRateLimit': true, // required! https://github.com/ccxt/ccxt/wiki/Manual#rate-limit
        })
        const key = 'ySuKhuOVLAC0WExO0UkaEXJzpDSWUYtNU0r69I8cCf25pZm5N7NHUUGMNaMfq92m';

        EXCHANGE = exchange;
    Object.entries((await exchange.fetchBalance()).total).forEach(item => {
      if (Math.round((item[1] * 100) / 100) > 0) {


        const XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

        const burl = "https://api.binance.com";

        let query = '/api/v1/ticker/24hr';

        query += `?symbol=${item[0]}USDT`;

        const url = burl + query;

        const ourRequest = new XMLHttpRequest();
        if (item[0] != 'USDT') {
        ourRequest.open('GET',url, true);

        var aTag = document.createElement('div');
        aTag.setAttribute('class',"item2");

        ourRequest.onload = function(){
            const obj = JSON.parse(ourRequest.responseText);
            if (item[0] != 'USDT') {

              var mydiv = document.querySelector(".container5");

              var link = document.createElement('a');
              link.setAttribute("action", "go");
              link.setAttribute("href", `../../coin.${item[0]}`);

              var aTag5 = document.createElement('img');
              aTag5.setAttribute('src',`../../assets/${item[0]}.jpg`);

              var aTag2 = document.createElement('h1');
              aTag2.setAttribute('class',"name-coin2");
              aTag2.innerHTML = item[0];

              var aTag3 = document.createElement('h1');
              aTag3.setAttribute('class',"value2");
              aTag3.innerHTML = `${Math.round(obj.lastPrice * 100) / 100}$`;

              coins[item[0]] = obj.lastPrice * item[1];

              if (mydiv != null) {
                mydiv.appendChild(link);
                link.appendChild(aTag);
                aTag.appendChild(aTag5);
                aTag.appendChild(aTag2);
                aTag.appendChild(aTag3);
              }

              sum += obj.lastPrice * item[1];
            }

            k += 1;
            if (mydiv != null) {
              document.querySelector(".total-value2").innerHTML = Math.round(sum * 100) / 100;
            }
        }
        ourRequest.send();
      }
      else {
        var mydiv = document.querySelector(".container5");

        var aTag5 = document.createElement('img');
        aTag5.setAttribute('src',`../../assets/${item[0]}.jpg`);

        var aTag = document.createElement('div');
        aTag.setAttribute('class',"item2");

        var link = document.createElement('a');
        link.setAttribute("action", "go");
        link.setAttribute("href", `../../coin.${item[0]}`);

        var aTag2 = document.createElement('h1');
        aTag2.setAttribute('class',"name-coin2");
        aTag2.innerHTML = item[0];

        var aTag3 = document.createElement('h1');
        aTag3.setAttribute('class',"value2");
        aTag3.innerHTML = `1$`;

        if (mydiv != null) {
          mydiv.appendChild(link);
          link.appendChild(aTag);
          aTag.appendChild(aTag5);
          aTag.appendChild(aTag2);
          aTag.appendChild(aTag3);
        }
        sum += item[1];
      }
      const pourcentChangePromise = (async function () {
          return (await EXCHANGE.fetchTicker(`${item[0]}/USDT`)).info.priceChangePercent;
        }) ();

        pourcentChangePromise.then((value) => {
          create.then(() => {
              var mydiv = document.querySelector(".container5");
              var aTags = document.querySelectorAll(".item2");

            if (value <= 0) {
              var change = document.createElement('div');
              change.setAttribute('class',"small-red");
              change.innerHTML = `${value}%`;
            } else {
              var change = document.createElement('div');
              change.setAttribute('class',"small-green");
              change.innerHTML = `${value}%`;
            }

            var aTag4 = document.createElement('div');
            aTag4.setAttribute('class',"position2");
            aTag4.innerHTML = Math.round((item[1] * 100) / 100);

            aTag4.insertAdjacentHTML('beforeEnd', `<br>${Math.round(item[1] * 100) / 100}$`);

            if (mydiv != null) {
              aTag.appendChild(change);
              aTag.appendChild(aTag4);
            }
          })
        })
      }
    });
}) ();
  var myfigure = document.querySelector(".highcharts-figure2");
  var aTag6 = document.createElement('div');

  aTag6.setAttribute('id',"container7");
  aTag6.setAttribute("class", "container7");

  if (myfigure != null) {
    myfigure.appendChild(aTag6);
  }

  let l = 0;
  const container = document.querySelector('#container7');
        // Make monochrome colors
  var pieColors = (function () {
      var colors = [],
          base = Highcharts.getOptions().colors[0],
          i;

      for (l = 0; l < 10; l += 0.5) {
          // Start out with a darkened base color (negative brighten), and end
          // up with a much brighter color
          colors.push(Highcharts.color(base).brighten((l - 3) / 7).get());
      }
      return colors;
  }());
  // Build the chart
  if (document.querySelector(".container7") != null) {

  let charts = Highcharts.chart('container7', {
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
              // JSON.parse(container.dataset.coins)[JSON.parse(container.dataset.positions)[0].coin_id - 1].title
              // JSON.parse(container.dataset.positions)[0].quantity * JSON.parse(container.dataset.coins)[JSON.parse(container.dataset.positions)[0].coin_id - 1].price
          ]
      }]
  });

  //charts.title.update({ text: JSON.parse(container.dataset.title)})
    setTimeout(function() {
      //your code to be executed after 5 second
      for (const [key, value] of Object.entries(coins)) {
      charts.series[0].addPoint({
              name: key,
              y: value
            });
      }
    }, 4000);
}
  var mydiv = document.querySelector(".api");

  var apiWallet = document.createElement('div');
  apiWallet.setAttribute('class',"item3");

  var divContainer = document.createElement('div');
  divContainer.setAttribute('class',"divContainer");

  var apiWallet2 = document.createElement('div');
  apiWallet2.setAttribute('class',"fas fa-wallet")
  apiWallet2.setAttribute("id", "wallet");

  var apiWallet3 = document.createElement('ul');

  var apiWallet4 = document.createElement('li');
  apiWallet4.innerHTML = "<strong>API binance</strong>";

  var apiWallet6 = document.createElement('div');
      apiWallet6.setAttribute("class", "line3");

  var apiWallet5 = document.createElement('li');
  apiWallet5.innerHTML = `Loading...`;
      if (mydiv != null) {
          mydiv.appendChild(apiWallet);
          apiWallet.appendChild(divContainer);
          divContainer.appendChild(apiWallet2);
          divContainer.appendChild(apiWallet3);
          apiWallet3.appendChild(apiWallet4);
          apiWallet3.appendChild(apiWallet5);
          divContainer.appendChild(apiWallet6);
        }

    setTimeout(function() {
      //your code to be executed after 5 second
      apiWallet5.innerHTML = `${Math.round((sum * 100) / 100)}$`;
      if (mydiv != null) {
          apiWallet3.appendChild(apiWallet5);
        }
    }, 3000);
  }
}

export {chartApi}
