document.addEventListener('turbolinks:load', () => {
  let currentUserData = document.getElementById('navbar_current_user').getAttribute('user_data');
  let currentUserId = JSON.parse(currentUserData).id;
  let allMsg = document.querySelectorAll('.message');

  allMsg.forEach(msg => {
    const checkMsgUserDiv = msg.querySelector('.content-container').querySelector('.check-msg-user')
    const msgOwnerId = Number(checkMsgUserDiv.querySelector('#msg-owner-id').getAttribute('value'));

    if (currentUserId === msgOwnerId) {
      msg.classList.add('my-msg');
    };
  });

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