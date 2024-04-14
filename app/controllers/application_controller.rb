class ApplicationController < ActionController::Base
  helper_method :find_user_name
  def welcome
    @links = Link.all
    @teachers = Teacher.all
    @students = Student.all
    render "pages/main"
  end

  def chat
    if student_signed_in?
      @user_type = "Student"
      @user_id = current_student.id
      @current_user = current_student
      @current_user_name = current_student.middle_name
    elsif teacher_signed_in?
      @user_type = "Teacher"
      @user_id = current_teacher.id
      @current_user = current_teacher
      @current_user_name = current_teacher.middle_name
    end
    @messages = Message.all
    render "pages/chatroom"
  end

  private

  def find_user_name(type, id)
    if type == "Student"
      Student.find(id).middle_name
    elsif type == "Teacher"
      Teacher.find(id).middle_name
    end
  end
end
