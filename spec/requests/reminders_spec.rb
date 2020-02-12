require 'rails_helper'

RSpec.describe 'Reminders', type: :request do
  describe 'GET /reminders' do
    it 'checks redirection after login' do
      get reminders_path
      expect(response).to have_http_status(302)
      user = build(:user)
      sign_in user
      get reminders_path
      expect(response).to have_http_status(200)
    end
  end
end
