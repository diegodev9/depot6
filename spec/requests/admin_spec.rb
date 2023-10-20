require 'rails_helper'
require 'support/database_cleaner'
require 'authentication_helpers'

RSpec.describe "Admins", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    it "returns http success" do
      login_as(user)
      get admin_index_url
      expect(response).to have_http_status(:success)
    end
  end
end
