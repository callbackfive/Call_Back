import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  
  let dialogbox_id = document.getElementById('dialogbox-id').getAttribute('data-dialogbox-id');

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  });

  consumer.subscriptions.create ({channel: "DialogboxChannel", dialogbox_id: dialogbox_id}, {
    connected() {
      console.log("Connected to dialogbox channel " + dialogbox_id);
    },
  
    disconnected() {
    },
  
    received(data) {
      const sendMsgBtn = document.getElementById('dialogbox-msg-submit-btn');
      sendMsgBtn.disabled = false;
      const msgForm = document.forms[0];
      msgForm.reset();
      const messageContainer = document.querySelector('.messages-container')
      messageContainer.innerHTML = messageContainer.innerHTML + data.html
      // 顏色左右邊
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

      if (window.addNewMsgToBtn) {
        window.addNewMsgToBtn(data.message)
      }
    }
  });
});

