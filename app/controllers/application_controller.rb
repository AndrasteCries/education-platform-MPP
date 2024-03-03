class ApplicationController < ActionController::Base
  def welcome
    render 'pages/main'
  end
end
