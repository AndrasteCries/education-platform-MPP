import consumer from "channels/consumer";

let chatChannel = null;

$(document).ready(function() {
  const connectButton = $('#connectButton');
  const disconnectButton = $('#disconnectButton');
  const currentUserType = $('#currentUserType');
  const currentUserId = $('#currentUserId');

  connectButton.on('click', function() {
    console.log("Ты снова хочешь меня убить?");
    if (!chatChannel) {
      chatChannel = consumer.subscriptions.create({ channel: 'ChatroomChannel', user_type: currentUserType.val(), user_id: currentUserId.val() }, {
        connected() {
          console.log("Я хочу умереть");
        },

        disconnected() {
          console.log("За что ты меня убил?!");
        },

        received(data) {
          console.log("Я счмсчямясчмясчмячм")
          let response = JSON.parse(data);
          const messagesContainer = $('#messages');
          console.log(messagesContainer);

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

          // Отображаем время сообщения
          const timeSpan = $('<span>').addClass('time');
          const now = new Date();
          timeSpan.text(now.getHours() + ":" + now.getMinutes() + " " + (now.getHours() >= 12 ? 'pm' : 'am'));
          newMessage.append(timeSpan);

          // Добавляем новое сообщение в начало списка
          messagesContainer.append(newMessage);
        },

        send_message(message) {
          console.log("Я вызвался")
          return this.perform('receive', { data: message });
        }
      });
    }
  });

  disconnectButton.on('click', function() {
    console.log("Ты думал убить меня?");
    console.log(chatChannel);
    if (chatChannel) {
      console.log("А меня на самом деле не существует");
      chatChannel.unsubscribe();
      chatChannel = null;
      console.log("WebSocket соединение отключено");
    }
  });
  const sendButton = $('#send_button');
  sendButton.on('click', function() {
    const inputField = $('#message_input');
    const currentUserName = $('#currentUserName');
    const currentUserType = $('#currentUserType');
    const message = inputField.val().trim();
    console.log("Ты уверен?");
    if (message !== '') {
      console.log(currentUserType.val());

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
