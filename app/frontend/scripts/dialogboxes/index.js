document.addEventListener('turbolinks:load', () => {

  // let currentUserData = document.getElementById('navbar_current_user').getAttribute('user_data');
  // let currentUserId = JSON.parse(currentUserData).id;
  // let allMsg = document.querySelectorAll('.message');

  // allMsg.forEach(msg => {
  //   let msgUserId = Number(document.getElementById('msg-user-id').getAttribute('value'));
  //   let newMessage = document.querySelector('.message');
  
  //   if (currentUserId === msgUserId) {
  //     newMessage.classList.add('my-msg');
  //   };

  // });


  // 點選視窗
  const tabs = document.querySelectorAll('[data-tab-target]');
  const tabContents = document.querySelectorAll('[data-tab-content]');

  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      const target = document.querySelector(tab.dataset.tabTarget);
      tabContents.forEach(tabContent => {
        tabContent.classList.remove('active')
      });
      tabs.forEach(tab => {
        tab.classList.remove('active')
      });
      tab.classList.add('active');
      target.classList.add('active');
    });
  });


});