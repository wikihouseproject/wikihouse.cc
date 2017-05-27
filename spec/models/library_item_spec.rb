require "rails_helper"

describe LibraryItem, :vcr do
  it "can't be created with an invalid repo" do
    subject = LibraryItem.new(title: "foo")
    expect(subject.valid?).to be_falsey
    expect(subject.errors[:title]).not_to be_empty
  end
end
