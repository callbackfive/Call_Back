document.addEventListener('turbolinks:load', () => {
  // TODO 送出與接收分欄對話框，JS顯示要正常
  // TODO 訊息左右邊CSS

  let currentUserData = document.getElementById('navbar_current_user').getAttribute('user_data');
  let currentUserId = JSON.parse(currentUserData).id;
  let allMsg = document.querySelectorAll('.message');

  console.log(currentUserId + "is current_user id");


  allMsg.forEach(msg => {
    const msgUserId = document.getElementById('msg-owner-id').getAttribute('value');
    const dilogboxStarterId = document.getElementById('dialogbox-starter-id').getAttribute('value');
    const projectOwnerOfTheDialogboxId = document.getElementById('project-owner-of-the-dialogbox-id').getAttribute('value');

    console.log(msg.innerHTML + " is the msg");
    console.log(msgUserId + " is msg owner id");
    console.log(dilogboxStarterId + " is dialogbox starter\(guest\) id");
    console.log(projectOwnerOfTheDialogboxId + " is project owner id");

    // if (currentUserId == msgUserId) {
    //   msg.classList.add('my-msg');
    // };

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