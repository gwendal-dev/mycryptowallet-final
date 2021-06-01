
var Highcharts = require('highcharts');
require('highcharts/highcharts');
require('highcharts/modules/exporting')(Highcharts);
// Create the chart
require('highcharts/modules/export-data')(Highcharts);
require('highcharts/modules/accessibility')(Highcharts);

const cardsApi = () => {

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

if ( container5 != null || apis != null) {
if (container5) {
  exchange2 = container5.dataset.exchange;
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
        aTag.setAttribute('class',"item2");

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

              sum += obj.lastPrice * item[1];

              price = obj.lastPrice;

              var mydiv = document.querySelector(".container5");
              var aTags = document.querySelectorAll(".item2");
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
              document.querySelector(".total-value2").innerHTML = `$${Math.round(sum * 100) / 100}`;
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
        aTag.setAttribute('class',"item2");

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

  var apiWallet = document.createElement('div');
  apiWallet.setAttribute('class',"item3");

  var divContainer = document.createElement('div');
  divContainer.setAttribute('class',"divContainer");

  var apiWallet2 = document.createElement('div');
  apiWallet2.setAttribute('class',"fas fa-wallet")
  apiWallet2.setAttribute("id", "wallet");

  var apiWallet3 = document.createElement('ul');

  var apiWallet4 = document.createElement('li');
  if (container5) {
    apiWallet4.innerHTML = `<strong>API ${container5.dataset.exchange}</strong>`;
  } else {
    apiWallet4.innerHTML = `<strong>API ${api.dataset.exchange}</strong>`;
  }



  var apiWallet6 = document.createElement('div');
      apiWallet6.setAttribute("class", "line3");

  var apiWallet5 = document.createElement('li');
  apiWallet5.innerHTML = `Loading...`;
      if (api != null) {
          api.appendChild(apiWallet);
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
      if (api != null) {
          apiWallet3.appendChild(apiWallet5);
        }
    }, 7000);
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
}
}

export {chartApi}