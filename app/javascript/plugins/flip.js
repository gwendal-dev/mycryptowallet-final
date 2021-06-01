const flip = () => {
  const container10 = document.querySelector(".container10");
  if (container10) {
    const cards = document.querySelectorAll(".card__inner");

    cards.forEach((card) => {card.addEventListener("click", function (e) {
      card.classList.toggle('is-flipped');
    });
    })
  } else {
    setTimeout(function() {
    const cards = document.querySelectorAll(".card__inner");

    cards.forEach((card) => {card.addEventListener("click", function (e) {
      card.classList.toggle('is-flipped');
    });
    })
    }, 7000);
  }
}

export {flip}
