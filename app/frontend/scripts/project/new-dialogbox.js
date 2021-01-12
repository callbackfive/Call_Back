document.addEventListener('turbolinks:load', () => {

  const popupBlock = document.querySelector('.new-dialogbox-popup-block');
  document.querySelector('.new-dialogbox-popup').addEventListener('click', (e) => {
    e.preventDefault();
    popupBlock.style.display = "flex";
  });

  const closeIcon = document.querySelector('.close-popup');
  closeIcon.addEventListener('click', (e) => {
    popupBlock.style.display = "none";
  });

});