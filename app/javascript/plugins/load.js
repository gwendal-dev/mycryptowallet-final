const load = () => {
  const loader = document.querySelector('.loader');
  const loader2 = document.querySelector('.loader2');
  const loader3 = document.querySelector('.loader3');
  const body = document.querySelector('body');

if (loader) {

setTimeout(function() {
  //your code to be executed after 7 second
    loader.classList.add('hidden');
    body.classList.add('scroll');
}, 7000);
} else if (loader2) {
  setTimeout(function() {
  //your code to be executed after 15 second
    loader2.classList.add('hidden');
    body.classList.add('scroll');
}, 15000);
} else if (loader3) {
    setTimeout(function() {
    //your code to be executed after 15 second
      loader3.classList.add('hidden');
      body.classList.add('scroll');
  }, 2000);
}
if (loader === null && loader2 === null && loader3 === null) {
  body.classList.add('scroll');
}
}

export {load}
