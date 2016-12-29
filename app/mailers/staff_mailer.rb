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

  def enquiry enquiry_id
    @enquiry = Enquiry.find(enquiry_id)
    mail to: "john@bitsushi.com"
  end
end
