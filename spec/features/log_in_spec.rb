require 'rails_helper'

describe 'log in', type: :feature do
  before do
    visit new_user_path
    click_button 'Sign Up'
    fill_in 'Email', with: 'fake@example.com'
    fill_in 'Password', with: 'FakePassword'
    fill_in 'First name', with: 'FakeFirstName'
    click_button 'Sign Up'
    visit logout_path
    visit root_path
    click_button 'Log In'
    fill_in 'Email', with: 'fake@example.com'
    fill_in 'Password', with: 'FakePassword'
    click_button 'Log In'
  end

  let(:user_to_login) { User.find_by(email: 'fake@example.com') }

  it 'successfully logged in' do
    expect(current_path).to eql(root_path)
  end

  it 'shows logged in page' do
    expect(page).to have_text('You are logged in as: FakeFirstName')
  end

end
