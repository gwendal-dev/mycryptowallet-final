const flip = () => {
    const cards = document.querySelectorAll(".card__inner");

    cards.forEach((card) => {card.addEventListener("click", function (e) {
      card.classList.toggle('is-flipped');
    });
    })
}

export {flip}
