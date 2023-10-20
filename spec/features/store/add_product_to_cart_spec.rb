require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe 'Add product to cart', type: :feature, js: true do
  let(:product) { create(:product) }

  before do
    product
  end

  scenario 'adds a product' do
    visit '/'

    click_button 'Add to Cart'

    expect(page).to have_css('tr.line-item-highlight')
    expect(page).to have_content(product.title)
    expect(page).to have_content("1")
    expect(page).to have_content(product.price)
  end
end
