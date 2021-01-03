import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  let textin_id = document.getElementById('texting-id').getAttribute('data-texting-id');

  console.log(textin_id);
  consumer.subscriptions.create({ channel: "TextingChannel", texting_id: textin_id }, {
    connected() {
      console.log('Connected to texting channel ' + textin_id);
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      console.log(data);
    }
  });
});

