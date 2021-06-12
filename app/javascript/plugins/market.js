const market = (number) => {
  const container2 = document.querySelector(".container2");
  const item0 = document.querySelector(".item0");
  const fetch = require("node-fetch");
  let i = 0;
  const arr = []
  if (container2 && item0) {

    function numberWithCommas(x) {
          return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }

    while (i < 200) {
      arr.push(i);
      i +=1;
    }
    if (number === 0) {

      async function firstCall() {
      await Promise.all(
        arr.map(async (i) => {
          const coin = document.querySelector(`.item${i}`);
          const coinTitle = coin.dataset.coins;

          const answer = await fetch(`https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=${coinTitle}`);
          const response = await answer.json();

            const volume = document.querySelector(`.info-market${i}`);
            const marketCap = document.querySelector(`.marketcap${i}`);
            const price = document.querySelector(`.coin-price${i}`);
            const  max_supply = document.querySelector(`.max-supply-info${i}`)

            const change = document.querySelector(`.change${i}`);

            volume.innerHTML = `${numberWithCommas(Math.round(response["data"][0]["volume_24h"]))}$`;

            marketCap.innerHTML = numberWithCommas(response['data'][0]['market_cap']);

            if (Math.round((response['data'][0]['price'] * 100) / 100) > 0) {

              price.innerHTML = `${numberWithCommas(Math.round(response['data'][0]['price'] * 100) / 100)}$`;
            } else {
              price.innerHTML = `${Math.round(response['data'][0]['price'] * 1000000) / 1000000}$`;
            }

            max_supply.innerHTML = numberWithCommas(Math.round(response["data"][0]["max_supply"]));


            if (response["data"][0]["max_supply"] == null) {
              max_supply.innerHTML = "";
            }
            if (response["data"][0]["max_supply"] == 0) {
              max_supply.innerHTML = "";
            }

            // console.log(Red);
            // console.log(response['data'][0]['percent_change_24h'])

            var aTagGreen = document.createElement('div');
            aTagGreen.setAttribute('class',`percent-green${i}`);
            aTagGreen.innerHTML = `${Math.round(response['data'][0]['percent_change_24h'] * 100) / 100}%`;

            var aTagRed = document.createElement('div');
            aTagRed.setAttribute('class',`percent-red${i}`);
            aTagRed.innerHTML = `${Math.round(response['data'][0]['percent_change_24h'] * 100) / 100}%`;

            if (response['data'][0]['percent_change_24h'] > 0) {
              change.appendChild(aTagGreen);
            } else if (response['data'][0]['percent_change_24h'] <= 0) {
              change.appendChild(aTagRed);
            } else {
              change.innerHTML = 0;
            }

          })
        )
    }

    firstCall();
  }
    setTimeout(function() {
      async function asyncCall() {

      await Promise.all(
        arr.map(async (i) => {
          const coin = document.querySelector(`.item${i}`);
          const coinTitle = coin.dataset.coins;

          const answer = await fetch(`https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=${coinTitle}`);
          const response = await answer.json();

            const volume = document.querySelector(`.info-market${i}`);
            const marketCap = document.querySelector(`.marketcap${i}`);
            const price = document.querySelector(`.coin-price${i}`);

            const change = document.querySelector(`.change${i}`);

            volume.innerHTML = `${numberWithCommas(Math.round(response["data"][0]["volume_24h"]))}$`;

            marketCap.innerHTML = numberWithCommas(response['data'][0]['market_cap']);

            if (Math.round((response['data'][0]['price'] * 100) / 100) > 0) {

              price.innerHTML = `${numberWithCommas(Math.round(response['data'][0]['price'] * 100) / 100)}$`;
            } else {
              price.innerHTML = `${Math.round(response['data'][0]['price'] * 1000000) / 1000000}$`;
            }

            let Red = "";
            let changeRed = "";
            let changeGreen = "";
            let Green = "";

            if (document.querySelector(`.percent-red${i}`)) {
              changeRed = document.querySelector(`.percent-red${i}`).innerHTML.replace(/%/, '');
              Red = parseFloat(changeRed);
            } else {
              changeGreen = document.querySelector(`.percent-green${i}`).innerHTML.replace(/%/, '');
              Green = parseFloat(changeGreen);
            }

            var aTagRectangleGreen = document.createElement('div');
            aTagRectangleGreen.setAttribute('class',"change_rectangle_green");

            var aTagRectangleRed = document.createElement('div');
            aTagRectangleRed.setAttribute('class',"change_rectangle_red");

            // console.log(Red);
            // console.log(response['data'][0]['percent_change_24h'])
            let percentGreen = document.querySelector(`.percent-green${i}`);
            let percentRed = document.querySelector(`.percent-red${i}`);
            let j = 0
            if (percentGreen) {
              if (response['data'][0]['percent_change_24h'] > Green) {
                j = 1;

                coin.appendChild(aTagRectangleGreen);
                setTimeout(function() {

                  aTagRectangleGreen.parentNode.removeChild(aTagRectangleGreen);
                }, 1000);
              } else if (response['data'][0]['percent_change_24h'] < Green) {
                j = 1;

                coin.appendChild(aTagRectangleRed);
                setTimeout(function() {

                  aTagRectangleRed.parentNode.removeChild(aTagRectangleRed);
                }, 1000);
              }
            }

            if (percentRed) {

              if (response['data'][0]['percent_change_24h'] > Red) {
                j = 1;

                coin.appendChild(aTagRectangleGreen);

                setTimeout(function() {

                  aTagRectangleGreen.parentNode.removeChild(aTagRectangleGreen);
                }, 1000);

              } else if (response['data'][0]['percent_change_24h'] < Red) {
                j = 1;

                coin.appendChild(aTagRectangleRed);
                setTimeout(function() {

                  aTagRectangleRed.parentNode.removeChild(aTagRectangleRed);
                }, 1000);
              }

            }

            var aTagGreen = document.createElement('div');
            aTagGreen.setAttribute('class',`percent-green${i}`);
            aTagGreen.innerHTML = `${Math.round(response['data'][0]['percent_change_24h'] * 100) / 100}%`;

            var aTagRed = document.createElement('div');
            aTagRed.setAttribute('class',`percent-red${i}`);
            aTagRed.innerHTML = `${Math.round(response['data'][0]['percent_change_24h'] * 100) / 100}%`;

            if (response['data'][0]['percent_change_24h'] > 0) {
              change.innerHTML = "";
              change.appendChild(aTagGreen);
            } else if (response['data'][0]['percent_change_24h'] <= 0) {
              change.innerHTML = "";
              change.appendChild(aTagRed);
            } else {
              change.innerHTML = "";
              change.innerHTML = 0;
            }

            percentGreen = document.querySelector(`.percent-green${i}`);
            percentRed = document.querySelector(`.percent-red${i}`);

            if (percentGreen && j === 1) {
              percentGreen.classList.add("black");
              setTimeout(function() {
                percentGreen.classList.remove("black");
              }, 1000);
            } else if (percentRed && j === 1) {
              percentRed.classList.add("black");
              setTimeout(function() {
                percentRed.classList.remove("black");
              }, 1000);
            }

          })
        )
    }
    asyncCall();
    market(1);
    }, 20000);
  }
}

export {market}
