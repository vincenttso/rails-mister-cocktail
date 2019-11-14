const navbar = document.querySelector('.cocktail-navbar')
const banner = document.querySelector('.banner')

const toggleNavbar = () => {
  if (banner) {
    navbar.classList.add('hidden')
    window.addEventListener('scroll', (event) => {
      if (window.scrollY >= banner.clientHeight) {
        navbar.classList.remove('hidden');
      } else {
        navbar.classList.add('hidden');
      }
    });
  }
}

export { toggleNavbar };
