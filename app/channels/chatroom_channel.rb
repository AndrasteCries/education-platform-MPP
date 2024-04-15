# frozen_string_literal: true

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

    case user_type
    when "Student"
      create_and_broadcast_message(content, "Student")
    when "Teacher"
      create_and_broadcast_message(content, "Teacher")
    else
      # Handle unsupported user types or errors
      puts "Unsupported user type: #{user_type}"
    end
  rescue JSON::ParserError => e
    puts "Данные не являются JSON: #{e.message}"
  end

  private

  def create_and_broadcast_message(content, recipient_type)
    Message.create(content:, recipient_type:, recipient_id: @user.id)
    ActionCable.server.broadcast("chat_room", data["data"])
  end
end
