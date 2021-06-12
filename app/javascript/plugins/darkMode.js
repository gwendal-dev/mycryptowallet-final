const darkMode = () => {
   var element = document.querySelector(".dark-mode");
   var body = document.body;
   console.log("hello")
   if (element) {
    console.log("hello")
      element.addEventListener("click",function() {
        body.classList.toggle("dark-mode");
    })
   }

}

export {darkMode}
