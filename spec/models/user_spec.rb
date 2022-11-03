require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let (:attributes) do
    {
      email: 'test@example.com',
      password: 'test',
      first_name: 'Test',
      last_name: 'TestLast'
    }
  end
  let (:missing_first_name) { attributes.except(:first_name) }
  let (:invalid_email) { attributes.merge(email: "wrong.email.example.com") }

  it "is valid" do
    expect(User.new(attributes)).to be_valid
  end

  it "is not valid without first name" do
    expect(User.new(missing_first_name)).not_to be_valid
  end

  it "is not valid with wrong email" do
    expect(User.new(invalid_email)).not_to be_valid
  end
end
