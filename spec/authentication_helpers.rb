  def login_as(user)
    if respond_to? :visit
      visit login_url
      fill_in :name, with: user.name
      fill_in :password, with: user.password
      click_on 'Login'
    else
      # FactoryBot.build(:user, password: 'password')
      post login_url, params: { name: user.name, password: 'password' }, as: :json
    end
  end

  def logout
    delete logout_url
  end
