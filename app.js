// define variable to store messages
let messages = [];

// add event listener to send button
document.getElementById("send-btn").addEventListener("click", function() {
  // get message from input field
  let message = document.getElementById("message-input").value;
  
  // add message to messages array
  messages.push(message);
  
  // clear input field
  document.getElementById("message-input").value = "";
  
  // determine which chat box to append message to
  let chatbox;
  if (messages.length % 2 === 1) {
    chatbox = document.getElementById("chatbox1");
  } else {
    chatbox = document.getElementById("chatbox2");
  }
  
  // create new message element and append to chat box
  let messageElement = document.createElement("p");
  messageElement.innerHTML = message;
  chatbox.appendChild(messageElement);
});
