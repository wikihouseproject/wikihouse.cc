# Preview all emails at http://localhost:3000/rails/mailers/staff_mailer
class StaffMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/staff_mailer/proposal
  def proposal
    StaffMailer.proposal
  end

end
