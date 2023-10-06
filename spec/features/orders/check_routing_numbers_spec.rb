require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe 'check routing numbers', type: :feature, js: true do
  let(:product) { create(:product) }

  before do
    product

    visit '/'
    click_on 'Add to Cart', match: :first
    find('button.checkout').click

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'
  end

  it 'does not show order routing number' do
    expect(page).not_to have_css('#order_routing_number')
  end
  
  it 'shows order routing number' do
    select 'Check', from: 'Pay type'

    expect(page).to have_css('#order_routing_number')
  end 
end
