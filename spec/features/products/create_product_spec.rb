require 'rails_helper'
require 'support/database_cleaner'
require 'authentication_helpers'

RSpec.describe 'Create product', type: :feature do
  let(:user) { create(:user) }
  let(:product) { build(:product, title: 'New brand product example 1') }
  let(:line_item) { 0 }

  before do
    login_as(user)
    product
  end

  scenario 'creating a valid product' do
    puts product
    visit '/products'
    click_link 'New Product'
    fill_in 'Title', with: product.title
    fill_in 'Description', with: product.description
    fill_in 'Image url', with: product.image_url
    fill_in 'Price', with: product.price
    click_button 'Create Product'

    expect(page).to have_content('Product was successfully created.')
  end

  scenario 'creating a invalid product' do
    puts product
    visit '/products'
    click_link 'New Product'
    fill_in 'Title', with: ''
    fill_in 'Description', with: ''
    fill_in 'Image url', with: ''
    fill_in 'Price', with: ''
    click_button 'Create Product'

    expect(page).to have_content('errors prohibited this product from being saved')
  end
end
