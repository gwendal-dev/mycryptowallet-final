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
  let m = 0;
  let coins = {};
  let moyenne = 0;
  let j = 0;
  let price = 0;
  let pourcentChange = 0;
  const moyenneChange = document.querySelector(".gain2");
  const loss = document.querySelector(".loss2");
  const moyenneArr = [];
  const container5 = document.querySelector(".container5");
  const apis = document.querySelectorAll(".api");
  let key = '';
  let secret_key = '';
  let exchange2 ='';
  let valid = 0;
  let z = 0;
  const arr_sum = [];
  let hide = false;
  const item10 = document.querySelector(".item10");

if (item10 != null) {
  container5.innerHTML = "";
}
if ( container5 != null || apis != null) {
if (container5) {
  exchange2 = container5.dataset.exchange;
  hide = container5.dataset.hide;
  key = container5.dataset.key;
  secret_key = container5.dataset.secret_key;

const create = (async function () {
    const exchangeId = exchange2
        , exchangeClass = ccxt[exchangeId]
        , exchange = new exchangeClass ({
            'apiKey': key,
            'secret': secret_key,
            'timeout': 30000,
            'enableRateLimit': true, // required! https://github.com/ccxt/ccxt/wiki/Manual#rate-limit
        })

    Object.entries((await exchange.fetchBalance()).total).forEach(item => {
      if (Math.round((item[1] * 100) / 100) > 0) {
        valid = 1;
        const pourcentChangePromise = (async function () {
            return (await exchange.fetchTicker(`${item[0]}/USDT`)).info.priceChangePercent;
          }) ();

      pourcentChangePromise.then((value) => {
        pourcentChange = value;

        const XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

        const burl = "https://api.binance.com";

        let query = '/api/v1/ticker/24hr';

        query += `?symbol=${item[0]}USDT`;

        const url = burl + query;

        const ourRequest = new XMLHttpRequest();
        if (item[0] != 'USDT') {
        ourRequest.open('GET',url, true);

        var aTag = document.createElement('div');
        aTag.setAttribute('class',"item10");

        ourRequest.onload = function(){
            const obj = JSON.parse(ourRequest.responseText);
            if (item[0] != 'USDT') {

              var mydiv = document.querySelector(".container5");

              var link = document.createElement('a');
              link.setAttribute("action", "go");
              link.setAttribute("href", `/coin.${item[0]}`);

              var logoText = document.createElement('div');
              logoText.setAttribute("class", "logo-text");

              var aTag5 = document.createElement('img');
              for (const coin in JSON.parse(mydiv.dataset.coins)) {
                if (coin === item[0]) {
                  aTag5.setAttribute('src',`${JSON.parse(mydiv.dataset.coins)[coin]}`);
                }
              }

              var aTag2 = document.createElement('h1');
              aTag2.setAttribute('class',"name-coin");
              aTag2.innerHTML = item[0];

              var aTag3 = document.createElement('h1');
              aTag3.setAttribute('class',"value");
              aTag3.innerHTML = `${Math.round(obj.lastPrice * 100) / 100}$`;

              coins[item[0]] = obj.lastPrice * item[1];

              if (mydiv != null) {
                mydiv.appendChild(link);
                link.appendChild(aTag);
                aTag.appendChild(logoText)
                logoText.appendChild(aTag5);
                logoText.appendChild(aTag2);
                logoText.appendChild(aTag3);
              }

              sum += obj.lastPrice * item[1];

              price = obj.lastPrice;

              var mydiv = document.querySelector(".container5");
              var aTags = document.querySelectorAll(".item10");
              moyenne += parseInt(pourcentChange) * (price * item[1]);
              moyenneArr.push(moyenne);

              j = j + (price * item[1]);

            if (pourcentChange <= 0) {
              var change = document.createElement('div');
              change.setAttribute('class',"small-red");
              change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
            } else {
              var change = document.createElement('div');
              change.setAttribute('class',"small-green");
              change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
            }

            var aTag4 = document.createElement('div');
            aTag4.setAttribute('class',"position2");
            aTag4.innerHTML = Math.round(item[1] * 100) / 100;

            aTag4.insertAdjacentHTML('beforeEnd', `<br>${Math.round((price * item[1]) * 100) / 100}$`);

            if (mydiv != null) {
              aTag.appendChild(change);
              aTag.appendChild(aTag4);
            }

            }

            k += 1;
            if (mydiv != null) {
              if (hide === "false") {
                document.querySelector(".total-value2").innerHTML = `$${Math.round(sum * 100) / 100}`;
              } else {
                document.querySelector(".total-value2").innerHTML = "*********";
              }
            }
        }
        ourRequest.send();

      }
      else {
        j = j + (1 * item[1]);

        if (pourcentChange <= 0) {
          var change = document.createElement('div');
          change.setAttribute('class',"small-red");
          change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
        } else {
          var change = document.createElement('div');
          change.setAttribute('class',"small-green");
          change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
        }

        moyenne += parseInt(pourcentChange) * (1 * item[1]);

        var mydiv = document.querySelector(".container5");

        var link = document.createElement('a');
        link.setAttribute("action", "go");
        link.setAttribute("href", `/coin.${item[0]}`);

        var logoText = document.createElement('div');
        logoText.setAttribute("class", "logo-text");

        var aTag5 = document.createElement('img');
        for (const coin in JSON.parse(mydiv.dataset.coins)) {
          if (coin === item[0]) {
            aTag5.setAttribute('src',`${JSON.parse(mydiv.dataset.coins)[coin]}`);
          }
        }

        var aTag2 = document.createElement('h1');
        aTag2.setAttribute('class',"name-coin");
        aTag2.innerHTML = item[0];

        var aTag3 = document.createElement('h1');
        aTag3.setAttribute('class',"value");
        aTag3.innerHTML = `${Math.round(obj.lastPrice * 100) / 100}$`;

        coins[item[0]] = obj.lastPrice * item[1];

        if (mydiv != null) {
          mydiv.appendChild(link);
          link.appendChild(aTag);
          aTag.appendChild(logoText)
          logoText.appendChild(aTag5);
          logoText.appendChild(aTag2);
          logoText.appendChild(aTag3);
        }
        sum += item[1];
      }
      })
      }
    });
}) ();
}
}
if (apis) {

  apis.forEach((api) => {
    exchange2 = api.dataset.exchange;
    key = api.dataset.key;
    secret_key = api.dataset.secret_key;
  const create = (async function () {
    const exchangeId = exchange2
        , exchangeClass = ccxt[exchangeId]
        , exchange = new exchangeClass ({
            'apiKey': key,
            'secret': secret_key,
            'timeout': 30000,
            'enableRateLimit': true, // required! https://github.com/ccxt/ccxt/wiki/Manual#rate-limit
        })

    Object.entries((await exchange.fetchBalance()).total).forEach(item => {
      if (Math.round((item[1] * 100) / 100) > 0) {
        valid = 1;
        const pourcentChangePromise = (async function () {
            return (await exchange.fetchTicker(`${item[0]}/USDT`)).info.priceChangePercent;
          }) ();
      pourcentChangePromise.then((value) => {
        pourcentChange = value;

        const XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

        const burl = "https://api.binance.com";

        let query = '/api/v1/ticker/24hr';

        query += `?symbol=${item[0]}USDT`;

        const url = burl + query;

        const ourRequest = new XMLHttpRequest();
        if (item[0] != 'USDT') {
        ourRequest.open('GET',url, true);

        var aTag = document.createElement('div');
        aTag.setAttribute('class',"item10");

        ourRequest.onload = function(){
            const obj = JSON.parse(ourRequest.responseText);
            if (item[0] != 'USDT') {

              var mydiv = document.querySelector(".container5");

              var link = document.createElement('a');
              link.setAttribute("action", "go");
              link.setAttribute("href", `/coin.${item[0]}`);

              var aTag5 = document.createElement('img');
              aTag5.setAttribute('src',`/assets/${item[0]}.jpg`);

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

              price = obj.lastPrice;

              var mydiv = document.querySelector(".container5");
              var aTags = document.querySelectorAll(".item10");
              moyenne += parseInt(pourcentChange) * (price * item[1]);
              moyenneArr.push(moyenne);

              j = j + (price * item[1]);

            if (pourcentChange <= 0) {
              var change = document.createElement('div');
              change.setAttribute('class',"small-red");
              change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
            } else {
              var change = document.createElement('div');
              change.setAttribute('class',"small-green");
              change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
            }

            var aTag4 = document.createElement('div');
            aTag4.setAttribute('class',"position2");
            aTag4.innerHTML = Math.round(item[1] * 100) / 100;

            aTag4.insertAdjacentHTML('beforeEnd', `<br>${Math.round((price * item[1]) * 100) / 100}$`);

            if (mydiv != null) {
              aTag.appendChild(change);
              aTag.appendChild(aTag4);
            }

            }

            k += 1;
            if (mydiv != null) {
              if (hide === "false") {
                document.querySelector(".total-value2").innerHTML = `$${Math.round(sum * 100) / 100}`;
              } else {
                document.querySelector(".total-value2").innerHTML = "*********";
              }
            }
        }
        ourRequest.send();

      }
      else {
        j = j + (1 * item[1]);

        if (pourcentChange <= 0) {
          var change = document.createElement('div');
          change.setAttribute('class',"small-red");
          change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
        } else {
          var change = document.createElement('div');
          change.setAttribute('class',"small-green");
          change.innerHTML = `${Math.round(pourcentChange * 100) / 100}%`;
        }

        moyenne += parseInt(pourcentChange) * (1 * item[1]);

        var mydiv = document.querySelector(".container5");

        var aTag5 = document.createElement('img');
        aTag5.setAttribute('src',`/assets/${item[0]}.jpg`);

        var aTag = document.createElement('div');
        aTag.setAttribute('class',"item10");

        var link = document.createElement('a');
        link.setAttribute("action", "go");
        link.setAttribute("href", `/coin.${item[0]}`);

        price = parseInt(obj.lastPrice);

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
      })
      }
    });
}) ();
})

  var arr_title_exchange = [];
  var y = 0;
  var a = 0;
  var arr_api = document.querySelectorAll(".api");
  var arr_apiWallet4 = document.querySelectorAll('.portfolio-title');
  arr_api.forEach((api) => {
    arr_title_exchange.push(api);
  })

  arr_apiWallet4.forEach((apiWallet4) => {
    apiWallet4.innerHTML = `API ${arr_title_exchange[y].dataset.exchange}`;
    y += 1;
  })
}
// message d'erreur:

// setTimeout(function() {
//   if (valid === 0) {
//     alert("Invalid API error or zero balance");
//   }
// }, 7000);

if (moyenneChange != null || loss != null) {

  setTimeout(function() {
      //your code to be executed after 7 second
      if ((moyenne / j) <= 0){
        loss.innerHTML = `${Math.round((moyenne / j)* 100) / 100}%`;
      }
      else {
        moyenneChange.innerHTML = `${Math.round((moyenne / j)* 100) / 100}%`;
      }
    }, 7000);
}

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
    }, 7000);
}
}

export {chartApi}
