class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{ENV.fetch('mailgun_domain')}>"
  layout 'mailer'
end
