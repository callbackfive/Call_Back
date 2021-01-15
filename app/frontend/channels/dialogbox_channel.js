import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  let dialogbox_id = document.getElementById('dialogbox-id').getAttribute('data-dialogbox-id');

  console.log(dialogbox_id);
  consumer.subscriptions.create({ channel: "DialogboxChannel", dialogbox_id: dialogbox_id }, {
    connected() {
      console.log('Connected to dialogbox channel ' + dialogbox_id);
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      console.log(data);
    }
  });
});

