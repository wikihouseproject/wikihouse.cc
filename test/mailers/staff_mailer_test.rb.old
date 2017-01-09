require 'test_helper'

class StaffMailerTest < ActionMailer::TestCase
  test "proposal" do
    mail = StaffMailer.proposal
    assert_equal "Proposal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
