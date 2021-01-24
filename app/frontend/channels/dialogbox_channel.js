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
      console.log(messageContainer.innerHTML + " 是MESSAGEcONTAINER.INNERHTML");
      console.log(data.html + " 是DATA.HTML");
      messageContainer.innerHTML = messageContainer.innerHTML + data.html

      // 顏色左右邊
      let currentUserData = document.getElementById('navbar_current_user').getAttribute('user_data');
      let currentUserId = JSON.parse(currentUserData).id;
      let allMsg = document.querySelectorAll('.message');
      allMsg.forEach(msg => {
        const checkMsgUserDiv = msg.querySelector('.content-container').querySelector('.check-msg-user')
        const msgOwnerId = Number(checkMsgUserDiv.querySelector('#msg-owner-id').getAttribute('value'));
        console.log(msg.innerHTML + " 是丟出的訊息");
        console.log(msgOwnerId + " 丟訊息的人的ID");
        if (currentUserId === msgOwnerId) {
          msg.classList.add('my-msg');
        };
      });



    }
  });
});

