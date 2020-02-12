require 'rails_helper'

RSpec.describe "ResetPassword", type: :feature do
  it "sends an email upon a password reset request" do
    user = create(:user)
    visit new_user_session_path
    click_link 'password'
    fill_in 'Email', with: user.email
    click_button 'reset password'
    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
    expect(last_email).to have_content user.email
  end
end
