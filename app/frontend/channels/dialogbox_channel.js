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
      console.log(messageContainer.innerHTML);
      messageContainer.innerHTML = messageContainer.innerHTML + data.html
    }
  });
});

