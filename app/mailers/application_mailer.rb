class ApplicationMailer < ActionMailer::Base
  if domain = ENV["mailgun_domain"]
    default from: "no-reply@#{domain}>"
  end

  layout 'mailer'
end
