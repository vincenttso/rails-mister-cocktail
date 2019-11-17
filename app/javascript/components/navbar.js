const navbar = document.querySelector('.cocktail-navbar')
const landingBack = document.querySelector('.landing-back')

const toggleNavbar = () => {
  if (landingBack) {
    navbar.setAttribute('hidden', '');
    navbar.classList.remove('d-flex');
    window.addEventListener('scroll', (event) => {
      if (window.scrollY >= landingBack.clientHeight) {
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
