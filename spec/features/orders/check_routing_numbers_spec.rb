require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe 'check routing numbers', type: :feature, js: true do
  include ActiveJob::TestHelper

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

  it 'complete payment' do
    select 'Check', from: 'Pay type'
    fill_in 'Routing #', with: '123456'
    fill_in 'Account #', with: '987654'

    perform_enqueued_jobs do
      click_button 'Place Order'
    end

    orders = Order.all
    expect(orders.count).to eq(1)

    order = orders.first
    expect(order.name).to eq('Dave Thomas')
    expect(order.address).to eq('123 Main Street')
    expect(order.email).to eq('dave@example.com')
    expect(order.pay_type).to eq('Check')
    expect(order.line_items.size).to eq(1)

    mail = ActionMailer::Base.deliveries.last
    expect(mail[:to].value).to eq('dave@example.com')
    expect(mail[:from].value).to eq('Sam Ruby <depot@example.com>')
    expect(mail.subject).to eq('Pragmatic Store Order Confirmation')
  end


end
