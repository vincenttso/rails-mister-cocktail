const searchInput = document.querySelector('.search-input');

const onSearch = () => {
  searchInput.addEventListener('search', (event) => {
    const cardName = document.querySelectorAll('.card-name');

    cardName.forEach((card) => {
      if (card.innerHTML.toLowerCase() === event.currentTarget.value.toLowerCase()) {
        window.scrollBy(0, (card.getBoundingClientRect().y - (window.innerHeight / 2)));
      }
    });
  });
}

export { onSearch };
