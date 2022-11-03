require "rails_helper"

describe "user creation", type: :feature do
  before do
    visit new_user_path
    # click_button "Sign Up"
    fill_in "Email", with: "fake@example.com"
    fill_in "Password", with: "FakePassword"
    fill_in "First name", with: "FakeFirstName"
    click_button "Sign Up"
  end

  let(:new_user) { User.find_by(email: "fake@example.com")}

  it  "creates a new user" do
    expect(new_user).not_to be_nil
  end

  it "has right attributes" do
    expect(new_user.email).to eq("fake@example.com")
    expect(new_user.first_name).to eq("FakeFirstName")
  end

  it "redirects to the main page" do
    expect(current_path).to eq(root_path)
  end


end