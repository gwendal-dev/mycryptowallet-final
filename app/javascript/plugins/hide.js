const hide = () => {
  const hidden = document.querySelector('.hide');
  const balance = document.querySelector(".total-value");
  const balance2 = document.querySelector(".total-value2");
  const balance3 = document.querySelector(".total-value3");
  const balance4 = document.querySelector(".balance");
  let saveBalance = '';
  let saveBalance2 = '';
  let saveBalance3 = '';
  let saveBalance4 = '';
  let i = 0;

  if (balance) {
    saveBalance = document.querySelector(".total-value").innerHTML
  }
  if (balance2) {
    setTimeout(function() {
      saveBalance2 = document.querySelector(".total-value2").innerHTML
      console.log(document.querySelector(".total-value2").innerHTML)
     }, 7000);
  }
  if (balance3) {
    saveBalance3 = document.querySelector(".total-value3").innerHTML
  }
  if (balance4) {
    saveBalance4 = document.querySelector(".balance").innerHTML
  }
  hidden.addEventListener("click", function (e) {
    if (i % 2 === 0) {
      if (balance) {
        balance.innerHTML = "********";
      }
      if (balance2) {
        balance2.innerHTML = "********";
      }
      if (balance3) {
        balance3.innerHTML = "********";
      }
      if (balance4) {
        balance4.innerHTML = "********";
      }
      i += 1;
    } else {
      if (balance) {
        balance.innerHTML = saveBalance;
      }
      if (balance2) {
        balance2.innerHTML = saveBalance2;
      }
      if (balance3) {
        balance3.innerHTML = saveBalance3;
      }
      if (balance4) {
        balance4.innerHTML = saveBalance4;
      }
      i += 1;
    }
  })
}

export {hide}
