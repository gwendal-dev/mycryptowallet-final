const load = () => {
  const loader = document.querySelector('.loader');
  const body = document.querySelector('body');

if (loader) {

setTimeout(function() {
  //your code to be executed after 1 second
    loader.classList.add('hidden');
    body.classList.add('scroll');
}, 7000);
}
body.classList.add('scroll');
}

export {load}
