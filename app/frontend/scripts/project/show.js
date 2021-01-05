document.addEventListener('turbolinks:load', () => {

  const textingCreateLink = document.querySelector('#texting-create-link');

  textingCreateLink.addEventListener('click', (e) => {
    // e.preventDefault;
    console.log(e);
  });

});