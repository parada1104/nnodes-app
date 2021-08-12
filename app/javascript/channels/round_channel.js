import consumer from "./consumer";

consumer.subscriptions.create("RoundChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const roundColumn = document.querySelector("[data-target='rounds_column']");
    roundColumn.insertAdjacentHTML("afterBegin", data.element);
  },
});
