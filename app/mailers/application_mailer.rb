class ApplicationMailer < ActionMailer::Base
  default from: "education_platform@example.com"
  layout "mailer"
  def send_issue
    @email = params[:email]
    mail(to: @email, subject: "Password recovery")
  end
end
