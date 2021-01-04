import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  let texting_id = document.getElementById('texting-id').getAttribute('data-texting-id');

  console.log(texting_id);
  consumer.subscriptions.create({ channel: "TextingChannel", texting_id: texting_id }, {
    connected() {
      console.log('Connected to texting channel ' + texting_id);
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      console.log(data);
    }
  });
});

