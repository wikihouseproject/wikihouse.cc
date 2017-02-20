require 'salesseek'

RSpec.describe SalesSeek do

  it "creates a valid salesseek payload from an enquiry" do

    enquiry = FactoryGirl.create(:enquiry,
      first_name: "Homer",
      last_name: "Simpson",
      email: "homer.j.simpson@example.com",
      data: {
        organisation: "Springfield Nuclear",
        role: "Nuclear Safety Inspector"
      }
    )

    expected_payload = {
      first_name: "Homer",
      last_name: "Simpson",
      organization: {name: "Springfield Nuclear"},
      roles: [{title: "Nuclear Safety Inspector"}],
      comments: "Automatically added via enquiry form",
      communication: [{ medium: "email", value: "homer.j.simpson@example.com" }],
      custom_fields: {
        ENV.fetch('salesseed_priority_proposal_custom_field_id') => 'false'
      }
    }

    expect(SalesSeek.build_payload(enquiry)).to eq(expected_payload)

  end

end
