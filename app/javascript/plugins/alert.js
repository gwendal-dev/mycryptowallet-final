const alert = (j) => {
  const alertsDiv = document.querySelector(".alert_notification")
  const root = document.querySelector("#root");
  let i = 0;
  const coins = JSON.parse(alertsDiv.dataset.coins);
  const alerts = JSON.parse(alertsDiv.dataset.alerts);
  const prices = JSON.parse(alertsDiv.dataset.prices);
  let newPrice = 0;
  const fetch = require("node-fetch");
  let arr = [];
  let arr_number = [];
  let k = 0;
  let l = 0;

  while (i < coins.length) {
    if (!coins[i] || !alerts[i] || !prices[i]) {
      coins.splice(i, 1);
      alerts.splice(i, 1);
      prices.splice(i, 1);
    }
    i += 1;
  }

  i = 0;

  while (i < coins.length) {
    arr.push(i);
    i +=1;
  }

  if (j === 1) {
  if (alertsDiv) {
    setTimeout(function() {
      async function asyncAlert() {
        await Promise.all(
        arr.map(async (i) => {
          if (prices[i] && alerts[i] && coins[i]) {
            const answer = await fetch(`https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=${coins[i]}`);
            const response = await answer.json();

            newPrice = response.data[0].price;

            l = 0;

            const div = document.querySelector(`.item${i}`);
            const valueAlert = document.querySelectorAll(`.value-alert`);
            const container2 = document.querySelector('.container2');

            if (alerts[i] > prices[i]) {
              if (newPrice >= alerts[i]) {
                arr_number[i] = 1;
                var aTag = document.createElement('div');
                aTag.setAttribute('class',"alert_notif");

                var aTag2 = document.createElement('p');
                aTag2.innerHTML = arr_number.reduce((a, b) => a + b, 0);

                root.appendChild(aTag);
                aTag.appendChild(aTag2);
                if (!container2) {
                  if (div) {
                    div.classList.add("background-red");

                    valueAlert.forEach((alert) => {
                    if (i === l) {
                      alert.classList.add("white");
                    }
                    l += 1;
                  })
                  }
                }
              }
            } else {
              if (newPrice <= alerts[i]) {
                arr_number[i] = 1;
                var aTag = document.createElement('div');
                aTag.setAttribute('class',"alert_notif");

                var aTag2 = document.createElement('p');
                aTag2.innerHTML = arr_number.reduce((a, b) => a + b, 0);

                root.appendChild(aTag);
                aTag.appendChild(aTag2);
                if (!container2) {
                  if (div) {
                    div.classList.add("background-red");

                    valueAlert.forEach((alert) => {
                    if (i === l) {
                      alert.classList.add("white");
                    }
                    l += 1;
                  })
                  }
                }
              }
            }
        }
      })
      )}
      asyncAlert();
      alert(1);

      }, 10000);
    }
  } else {
    async function firstCallAlert() {
      await Promise.all(
      arr.map(async (i) => {
        if (prices[i] && alerts[i] && coins[i]) {
          const answer = await fetch(`https://api.lunarcrush.com/v2?data=assets&key=dobdvvfchtpmfr5qq1nu&symbol=${coins[i]}`);
          const response = await answer.json();

          const div = document.querySelector(`.item${i}`);
          const valueAlert = document.querySelectorAll(`.value-alert`);

          const container2 = document.querySelector('.container2');

          l = 0;

          newPrice = response.data[0].price;;
          if (alerts[i] > prices[i]) {
            if (newPrice >= alerts[i]) {
              arr_number[i] = 1;
              var aTag = document.createElement('div');
              aTag.setAttribute('class',"alert_notif");

              var aTag2 = document.createElement('p');
              aTag2.innerHTML = arr_number.reduce((a, b) => a + b, 0);

              root.appendChild(aTag);
              aTag.appendChild(aTag2);
              if (!container2) {
                if (div) {
                  div.classList.add("background-red");

                  valueAlert.forEach((alert) => {
                  if (i === l) {
                    alert.classList.add("white");
                  }
                  l += 1;
                })
                }
              }
            }
          } else {
            if (newPrice <= alerts[i]) {
              arr_number[i] = 1;
              var aTag = document.createElement('div');
              aTag.setAttribute('class',"alert_notif");

              var aTag2 = document.createElement('p');
              aTag2.innerHTML = arr_number.reduce((a, b) => a + b, 0);

              root.appendChild(aTag);
              aTag.appendChild(aTag2);
              if (!container2) {
                if (div) {
                  div.classList.add("background-red");

                  valueAlert.forEach((alert) => {
                  if (i === l) {
                    alert.classList.add("white");
                  }
                  l += 1;
                })
                }
              }
            }
          }
      }
    })
    )}
    firstCallAlert();
    alert(1);
  }
}

export {alert}
