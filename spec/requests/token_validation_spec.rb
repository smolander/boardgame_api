# Usage example, note lines 9, 12 and 19
# - user should be a valid devise-enabled model factory

require 'rails_helper'

RSpec.describe "Token Validations", type: :request do
  describe 'signed in' do
    #let(:user) { create :user }

    it 'creates a user using email/password combo' do
      host! "localhost"
      post '/auth', params: { user: {email: 'testmail@mail.com', password: 'blah127',password_confirmation: 'blah127'}}
      puts response.body
      expect(response.body).not_to have_content('error')
    end
  end

  # describe 'signed out' do
  #   it 'should respond with unauthorized' do
  #     get '/api/auth/validate_token'
  #     expect(response).to have_http_status(:unauthorized)
  #   end
  # end
end