import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  
  let dialogbox_id = document.getElementById('dialogbox-id').getAttribute('data-dialogbox-id');

  consumer.subscriptions.create ({channel: "DialogboxChannel", dialogbox_id: dialogbox_id}, {
    connected() {
      console.log("Connected to dialogbox channel " + dialogbox_id);
    },
  
    disconnected() {
    },
  
    received(data) {
      console.log(data);
      const messageContainer = document.getElementById('messages-container')
      messageContainer.innerHTML = messageContainer.innerHTML + data.html
    }
  });
});

