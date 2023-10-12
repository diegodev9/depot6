require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }

  it "prompts for login" do
    get login_url
    expect(response).to have_http_status(:success)
  end

  it "logins" do
    post login_url, params: { name: user.name, password: user.password }, as: :html
    expect(response).to redirect_to(admin_index_url)
    expect(session[:user_id]).to eq(user.id)
  end

  it 'fails login' do
    post login_url, params: { name: user.name, password: '' }, as: :html
    expect(response).to redirect_to(login_url)
  end

  it 'logout' do
    delete logout_url, as: :html
    expect(response).to redirect_to(store_index_url) 
  end
end
