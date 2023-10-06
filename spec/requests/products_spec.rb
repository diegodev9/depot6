require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe '/products', type: :request do
  let(:product) { create(:product) }

  before do
    product
  end

  it "can't delete product in cart" do
    delete product_url(product)

    expect(response).to redirect_to(products_url)
  end

  it 'destroys a product' do
    expect do
      delete product_url(product)
    end.to change(Product, :count).by(-1)
  end
end
