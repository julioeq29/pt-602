const sideBar = document.getElementById('sidebar-toggle');
const overLay = document.getElementById('overlay');

const toggleSideBarOpenOverLay = (bar) => {
  bar.currentTarget.classList.toggle('active');
  overLay.classList.toggle('open');
}

const activateSideBar = () => {
  if (sideBar) {
    sideBar.addEventListener('click', toggleSideBarOpenOverLay)
  }
}

export { activateSideBar }
