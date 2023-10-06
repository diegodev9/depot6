require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/orders", type: :request do
  let(:product) { create(:product) }

  context 'without a product' do
    it 'requires item in cart' do
      get new_order_url
      expect(response).to redirect_to(store_index_url)
    end
  end

  context 'with product' do
    it 'should get new order' do
      post line_items_url, params: { product_id: product.id }, as: :json
      get new_order_url

      expect(response).to be_successful
    end
  end

  context 'generate a successful order' do
    before do
      product
      @address = Faker::Address.full_address
      @email = Faker::Internet.email
      @name = Faker::Name.name
      @pay_type = 'Check'
    end

    it 'should redirect to store index after successfull order' do
      post orders_url, params: { order: { address: @address, email: @email, name: @name, pay_type: @pay_type } }, as: :html

      expect(response).to redirect_to(store_index_url)
    end

    it 'flashes a success message' do
      post orders_url, params: { order: { address: @address, email: @email, name: @name, pay_type: @pay_type } }, as: :html

      expect(request.flash[:notice]).to eq('Thank you for your order.')
    end
  end
end
