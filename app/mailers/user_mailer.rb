class UserMailer < ActionMailer::Base
  # default from: "http://localhost:3000"
  def welcome
    mail(to: "tjterris@gmail.com", subject: "Welcome", body: "Have a nice day")
  end
end
