class ApplicationController < ActionController::Base
  def welcome
    @teachers = Teacher.all
    @students = Student.all
    render 'pages/main'
  end
end
