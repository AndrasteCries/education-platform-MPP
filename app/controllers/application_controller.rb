# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :find_user_name
  before_action :set_locale
  before_action :redirect_to_locale
  def welcome
    @links = Link.all
    @teachers = Teacher.all
    @students = Student.all

    @def_local = I18n.locale
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
  def redirect_to_locale
    if request.path == "/" && !params[:locale].present?
      redirect_to root_path(locale: "en")
    end
  end
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options
    {locale: I18n.locale}
  end
  def find_user_name(type, id)
    if type == "Student"
      Student.find(id).middle_name
    elsif type == "Teacher"
      Teacher.find(id).middle_name
    end
  end
end
