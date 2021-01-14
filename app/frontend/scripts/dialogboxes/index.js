document.addEventListener('turbolinks:load', () => {

  let currentUserData = document.getElementById('navbar_current_user').getAttribute('user_data');
  let currentUserId = JSON.parse(currentUserData).id;

  let allMsg = document.querySelectorAll('.message')

    
  
  let msgUserId = Number(document.getElementById('msg-user-id').getAttribute('value'));

  let newMessage = document.querySelector('.message');

  if (currentUserId === msgUserId) {
    newMessage.classList.add('my-msg');
  };

});