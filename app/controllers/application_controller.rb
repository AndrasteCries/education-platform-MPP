class ApplicationController < ActionController::Base
  def welcome
    @links = Link.all
    @teachers = Teacher.all
    @students = Student.all
    render 'pages/main'
  end
end
