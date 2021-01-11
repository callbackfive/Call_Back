document.addEventListener('turbolinks:load', () => {

  const newDialogboxLink = document.querySelector('.new-dialogbox-link');

  newDialogboxLink.addEventListener('click', (e) => {
    // e.preventDefault;
    console.log(e);
  });

});