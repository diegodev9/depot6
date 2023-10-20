require 'rails_helper'
require 'support/database_cleaner'
require 'authentication_helpers'

RSpec.describe 'update a product', type: :feature do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:update_product) { build(:product) }

  before do
    login_as(user)
    product
    update_product
  end

  scenario do
    visit '/'
    visit products_url
    click_on "Edit", match: :first

    fill_in "Description", with: update_product.description
    fill_in "Image url", with: update_product.image_url
    fill_in "Price", with: update_product.price
    fill_in "Title", with: update_product.title
    click_on "Update Product"

    expect(page).to have_content("Product was successfully updated.")
    click_on "Back"
  end
end
