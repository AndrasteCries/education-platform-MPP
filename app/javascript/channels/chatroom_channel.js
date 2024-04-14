import consumer from "channels/consumer";

let chatChannel = null;

$(document).ready(function() {
  const connectButton = $('#connectButton');
  const disconnectButton = $('#disconnectButton');
  const currentUserType = $('#currentUserType');
  const currentUserId = $('#currentUserId');

  connectButton.on('click', function() {
    if (!chatChannel) {
      chatChannel = consumer.subscriptions.create({ channel: 'ChatroomChannel', user_type: currentUserType.val(), user_id: currentUserId.val() }, {
        connected() {
        },

        disconnected() {
        },

        received(data) {
          let response = JSON.parse(data);
          const messagesContainer = $('#messages');

          const newMessage = $('<li>');
          const contentParagraph = $('<p>');

          if (response.user_id === currentUserId.val() && response.user_type === currentUserType.val()) {
            newMessage.addClass('replay');
            contentParagraph.text(response.content);
          } else {
            newMessage.addClass('sender');
            contentParagraph.text(response.user_name + ": " + response.content);
          }

          newMessage.append(contentParagraph);

          const timeSpan = $('<span>').addClass('time');
          const now = new Date();
          timeSpan.text(now.getHours() + ":" + now.getMinutes() + " " + (now.getHours() >= 12 ? 'pm' : 'am'));
          newMessage.append(timeSpan);

          messagesContainer.append(newMessage);
        },

        send_message(message) {
          return this.perform('receive', { data: message });
        }
      });
    }
  });

  disconnectButton.on('click', function() {
    if (chatChannel) {
      chatChannel.unsubscribe();
      chatChannel = null;
    }
  });
  const sendButton = $('#send_button');
  sendButton.on('click', function() {
    const inputField = $('#message_input');
    const currentUserName = $('#currentUserName');
    const currentUserType = $('#currentUserType');
    const message = inputField.val().trim();
    if (message !== '') {
      let data = {
        content: message,
        user_type: currentUserType.val(),
        user_name: currentUserName.val(),
        user_id: currentUserId.val()
      };
      data = JSON.stringify(data);
      chatChannel.send_message(data);
      inputField.val('');
    }
  });
});
