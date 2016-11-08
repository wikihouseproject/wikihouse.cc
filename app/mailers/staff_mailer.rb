class StaffMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.staff_mailer.proposal.subject
  #
  def proposal
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
