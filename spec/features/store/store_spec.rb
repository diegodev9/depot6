require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe 'Get index', type: :feature do
  let(:products) { create_list(:product, 3) }

  before do
    products
  end

  scenario do
    visit '/'

    expect(page).to have_selector('nav.side_nav a', count: 4)
    expect(page).to have_selector('main .product', count: 3)
    expect(page).to have_content(products.first.title)
    expect(page).to have_selector('.price')
    price_text = first('.price').text
    expect(price_text).to match(/\$[,\d]+\.\d\d/)
  end
end

