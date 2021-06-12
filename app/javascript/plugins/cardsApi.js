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
  const container = document.querySelector(".info-flip");
  const apis = document.querySelectorAll(".api");
  let key = '';
  let secret_key = '';
  let exchange2 ='';
  let valid = 0;
  let arr_title = [];
  let arr_quantity = [];
  let arr_price = [];
  let EXCHANGE = '';

  exchange2 = container.dataset.exchange;
  key = container.dataset.key;
  secret_key = container.dataset.secret_key;

const create = (async function () {
    const exchangeId = exchange2
        , exchangeClass = ccxt[exchangeId]
        , exchange = new exchangeClass ({
            'apiKey': key,
            'secret': secret_key,
            'timeout': 30000,
            'enableRateLimit': true, // required! https://github.com/ccxt/ccxt/wiki/Manual#rate-limit
        })
        EXCHANGE = exchange;

    Object.entries((await exchange.fetchBalance()).total).forEach(item => {
      if (Math.round((item[1] * 100) / 100) > 0) {

        arr_title.push(item[0]);
        arr_quantity.push(item[1]);

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
        aTag.setAttribute('class',"item200");

        ourRequest.onload = function(){
            const obj = JSON.parse(ourRequest.responseText);
            if (item[0] != 'USDT') {

              arr_price.push(obj.lastPrice);

              var card = document.querySelector(".card");

              // DUPLICATE
              var clone = card.cloneNode(true); // "deep" clone
              clone.id = "duplicater" + ++i;
              // or clone.id = ""; if the divs don't need an ID
              card.parentNode.appendChild(clone);

              sum += obj.lastPrice * item[1];

              price = obj.lastPrice;


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


            }

            k += 1;
        }
        ourRequest.send();

      }
      else {
        arr_price.push(1);
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
        aTag.setAttribute('class',"item200");

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

setTimeout(function() {
  let n = 0;
  let o = 0;
  let p = 0;
  let q = 0;
  let r = 0;
    var arr_div1 = document.querySelectorAll(".card-coin-title");
    var arr_div2 = document.querySelectorAll(".total-card");
    var arr_div3 = document.querySelectorAll(".value-card");
    var arr_div4 = document.querySelectorAll(".gain-card");
    var arr_div5 = document.querySelectorAll(".debit-card");
    var arr_div6 = document.querySelectorAll(".last-price-card");
    var arr_div7 = document.querySelectorAll(".variation-card-red");
    var arr_div8 = document.querySelectorAll(".variation-card-green");
    var arr_img = document.querySelectorAll('.img-top');
    var last = document.querySelectorAll('.card');

    arr_img.forEach((img) => {
      img.setAttribute("style", `background-image: linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)), url(/assets/${arr_title[q]}.jpg'); background-position: center center; background-size: cover;`);
      q += 1;
    })

    arr_div1.forEach((div) => {
      div.innerHTML = arr_title[n];
      n += 1;
    })

    arr_div2.forEach((div) => {
      div.innerHTML = `Total : ${arr_quantity[o]}`;
      o += 1;
    })

    arr_div3.forEach((div) => {
      div.innerHTML = `Value : ${arr_quantity[p] * arr_price[p]}$`;
      p += 1;
    })

    arr_div5.forEach((div) =>{
      if (arr_title[r]) {
        const pourcentChangePromise = (async function () {
          return (await EXCHANGE.fetchTicker(`${arr_title[r]}/USDT`)).info.priceChangePercent;
        }) ();

        pourcentChangePromise.then((value) => {
          if (value <= 0) {
            div.innerHTML = `Loss : ${value}`;
          }
        })
      }
      r += 1;
    })

    r = 0;

    arr_div4.forEach((div) => {
      if (arr_title[r]) {
        const pourcentChangePromise = (async function () {
          return (await EXCHANGE.fetchTicker(`${arr_title[r]}/USDT`)).info.priceChangePercent;
        }) ();

        pourcentChangePromise.then((value) => {
          if (value > 0) {
            div.innerHTML = `Gain : ${value}`;
          }
        })
      }
      r += 1;
    })

    r = 0;

    arr_div6.forEach((div) => {
      div.innerHTML = `Current price : ${arr_price[r]}$`
      r += 1;
    })

    r = 0;

    arr_div7.forEach((div) => {
      if (arr_title[r]) {
        const pourcentChangePromise = (async function () {
          return (await EXCHANGE.fetchTicker(`${arr_title[r]}/USDT`)).info.priceChangePercent;
        }) ();

        pourcentChangePromise.then((value) => {
          if (value <= 0) {
            div.innerHTML = `Variation 24h : ${value}`;
          }
        })
      }
      r += 1;
    })

    r = 0;

    arr_div8.forEach((div) => {
      if (arr_title[r]) {
        const pourcentChangePromise = (async function () {
          return (await EXCHANGE.fetchTicker(`${arr_title[r]}/USDT`)).info.priceChangePercent;
        }) ();

        pourcentChangePromise.then((value) => {
          if (value > 0) {
            div.innerHTML = `Variation 24h : ${value}`;
          }
        })
      }
      r += 1;
    })
    r = 0;
    var size = last.length;
    last[size - 1].innerHTML = '';

    var tradingview = document.querySelector("#tradingview3");
    arr_div1.forEach((div) => {

            if ( arr_title[r] != 'USDT') {
                new TradingView.MediumWidget(
                        {
                        "symbols": [
                          [
                            "Crypto",
                            `BINANCE:${arr_title[r]}USDT|12M`
                          ]
                        ],
                        "chartOnly": false,
                        "width": "100%",
                        "height": "100%",
                        "locale": "en",
                        "colorTheme": "light",
                        "gridLineColor": "#F0F3FA",
                        "trendLineColor": "#2196F3",
                        "fontColor": "#787B86",
                        "underLineColor": "#E3F2FD",
                        "isTransparent": false,
                        "autosize": true,
                        "container_id": `tradingview${i}`
                      }
                        );
              } else {
                new TradingView.MediumWidget(
                        {
                        "symbols": [
                          [
                            "Crypto",
                            `BINANCEUS:${arr_title[r]}USD|12M`
                          ]
                        ],
                        "chartOnly": false,
                        "width": "100%",
                        "height": "100%",
                        "locale": "en",
                        "colorTheme": "light",
                        "gridLineColor": "#F0F3FA",
                        "trendLineColor": "#2196F3",
                        "fontColor": "#787B86",
                        "underLineColor": "#E3F2FD",
                        "isTransparent": false,
                        "autosize": true,
                        "container_id": `tradingview${i}`
                      }
                        );
              }
    })


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

export {cardsApi}
