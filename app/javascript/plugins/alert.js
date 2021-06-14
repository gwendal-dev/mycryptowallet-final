const alert = () => {
  const alertsDiv = document.querySelector(".alert_notification")
  if (alertsDiv) {
    setTimeout(function() {
      const root = document.querySelector("#root");
      let i = 0;
      const alerts = JSON.parse(alertsDiv.dataset.alert);
      if (alertsDiv.dataset.user) {
        const current_user = JSON.parse(alertsDiv.dataset.user);
        alerts.forEach((alert) => {
          if (alert[1] == current_user) {
            i += 1;
          }
        })
        if (i > 0) {
          var aTag = document.createElement('div');
          aTag.setAttribute('class',"alert_notif");

          var aTag2 = document.createElement('p');
          aTag2.innerHTML = i;

          root.appendChild(aTag);
          aTag.appendChild(aTag2);
        }
      }
      alert();
      }, 2000);
    }
}

export {alert}
