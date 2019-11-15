const navbar = document.querySelector('.cocktail-navbar')
const banner = document.querySelector('.banner')

const toggleNavbar = () => {
  if (banner) {
    navbar.setAttribute('hidden', '');
    navbar.classList.remove('d-flex');
    window.addEventListener('scroll', (event) => {
      if (window.scrollY >= banner.clientHeight) {
        navbar.removeAttribute('hidden', '');
        navbar.classList.add('d-flex');
      } else {
        navbar.setAttribute('hidden', '');
        navbar.classList.remove('d-flex');
      }
    });
  }
}

export { toggleNavbar };
