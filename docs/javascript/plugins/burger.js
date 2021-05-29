function burger() {
    const menu = document.getElementById("topnav_responsive_menu");
    const icon = document.getElementById("topnav_hamburger_icon");
    const root = document.getElementById("root");

    icon.addEventListener('click',function(){
      if (menu.className === "") {
        menu.className = "open";
        icon.className = "open";
        root.style.overflowY = "hidden";
    } else {
        menu.className = "";
        icon.className = "";
        root.style.overflowY = "";
    }
    });
}

export {burger};
