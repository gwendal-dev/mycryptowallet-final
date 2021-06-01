const load = () => {
  const loader = document.querySelector('.loader');
  const loader2 = document.querySelector('.loader2');
  const body = document.querySelector('body');

if (loader) {

setTimeout(function() {
  //your code to be executed after 1 second
    loader.classList.add('hidden');
    body.classList.add('scroll');
}, 7000);
} else if (loader2) {
  setTimeout(function() {
  //your code to be executed after 1 second
    loader2.classList.add('hidden');
    body.classList.add('scroll');
}, 15000);
}
if (loader === null && loader2 === null) {
  body.classList.add('scroll');
}
}

export {load}
