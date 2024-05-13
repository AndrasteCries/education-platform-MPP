class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    user_type = params[:user_type]
    user_id = params[:user_id]
    if user_type == "Student"
      @user = Student.find(user_id)
      stream_from "chat_room"
    elsif user_type == "Teacher"
      @user = Teacher.find(user_id)
      stream_from "chat_room"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    json_data = JSON.parse(data["data"])
    content = json_data["content"]
    user_type = json_data["user_type"]
    if user_type == "Student"
      Message.create(content:, recipient_type: "Student", recipient_id: @user.id)
      ActionCable.server.broadcast("chat_room", data["data"])
    elsif user_type == "Teacher"
      Message.create(content:, recipient_type: "Teacher", recipient_id: @user.id)
      ActionCable.server.broadcast("chat_room", data["data"])
    end
  rescue JSON::ParserError => e
    puts "Данные не являются JSON: #{e.message}"
  end
end
