require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe 'empty a cart', type: :feature do
  let(:product) { create(:product) }

  before do
    product
  end

  scenario do
    visit '/'
    click_button 'Add to Cart'
    find('button.btn-empty-cart').click

    expect(page).to have_content('Your cart is currently empty.')
  end
end
