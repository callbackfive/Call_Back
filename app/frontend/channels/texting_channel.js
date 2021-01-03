import consumer from "./consumer"

consumer.subscriptions.create({ channel: "TextingChannel", texting_id: 1 }, {
  connected() {
    console.log('Connected to texting channel...');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
  }
});
