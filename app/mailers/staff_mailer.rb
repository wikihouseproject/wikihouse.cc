class StaffMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.staff_mailer.proposal.subject
  #

  def enquiry enquiry_id
    @enquiry = Enquiry.find(enquiry_id)
    mail to: "john@bitsushi.com",
      reply_to: "#{@enquiry.first_name} #{@enquiry.last_name} <#{@enquiry.email}>",
      subject: @enquiry.kind.gsub('-',' ').humanize,
      from: "WikiHouse.cc <no-reply@wikihouse.cc>"
  end
end
