ActionMailer::Base.smtp_settings = {
  address: "smtp.gmx.de",
  port: 587,
  domain: 'gmx.de',
  user_name: ENV['GMX_ADDRESS'],
  password: ENV['GMX_APP_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
