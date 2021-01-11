document.addEventListener('turbolinks:load', () => {

  const popupBlock = document.querySelector('.new-dialogbox-popup-block');
  document.querySelector('.new-dialogbox-popup').addEventListener('click', (e) => {
    e.preventDefault();
    popupBlock.classList.remove('no-popup');
    popupBlock.classList.add('popuped');
  });

  const closeIcon = document.querySelector('.close-popup');
  closeIcon.addEventListener('click', (e) => {
    popupBlock.classList.remove('popuped');
    popupBlock.classList.add('no-popup');
  });

});