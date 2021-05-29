const load = () => {
  const loader = document.querySelector('.loader');
  const body = document.querySelector('body');

if (loader) {
loader.addEventListener('click', () => {

    loader.classList.add('hidden');
    body.classList.add('scroll');
})

setTimeout(function() {
  //your code to be executed after 1 second
    loader.classList.add('hidden');
    body.classList.add('scroll');
}, 3000);
}
body.classList.add('scroll');
}

export {load}
