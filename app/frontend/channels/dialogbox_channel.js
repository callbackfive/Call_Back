import consumer from "./consumer"

// const dialogbox_id = document.getElementById('dialogbox-id').getAttribute('data-dialogbox-id');

consumer.subscriptions.create ("DialogboxChannel", {
  connected() {
    console.log("Connected to dialogbox channel ...");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
  }
});
