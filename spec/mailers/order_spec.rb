require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe OrderMailer, type: :mailer do
  let(:line_item) { create(:line_item) }
  let(:order) { create(:order, line_item_ids: line_item.id) }

  before do
    order
  end

  describe 'received' do
    let(:email) { OrderMailer.received(order) }

    it 'renders the headers' do
      expect(email.subject).to eq('Pragmatic Store Order Confirmation')
      expect(email.to).to eq([order.email])
      expect(email.from).to eq(['depot@example.com'])
    end

    it 'renders the body' do
      expect(email.body.encoded).to match(order.line_items.first.product.title)
    end
  end

  describe 'shipped' do
    let(:email) { OrderMailer.shipped(order) }

    it 'renders the headers' do
      expect(email.subject).to eq('Pragmatic Store Order Shipped')
      expect(email.to).to eq([order.email])
      expect(email.from).to eq(['depot@example.com'])
    end

    it 'renders the body' do
      expect(email.body.encoded).to match(order.line_items.first.product.title)
    end
  end

end
