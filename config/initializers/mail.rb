ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => 'MANDRILL_USERNAME',
    :password  => 'MANDRILL_API_KEY',
    :domain    => 'http://localhost:3000'
  }
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = ENV['MANDRILL_API_KEY']
end
