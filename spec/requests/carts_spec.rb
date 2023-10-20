require 'rails_helper'
require 'support/database_cleaner'

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

RSpec.describe "/carts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Cart. As you add validations to Cart, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Cart.create! valid_attributes
      get carts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cart = Cart.create! valid_attributes
      get cart_url(cart)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cart_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      cart = Cart.create! valid_attributes
      get edit_cart_url(cart)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cart" do
        expect {
          post carts_url, params: { cart: valid_attributes }
        }.to change(Cart, :count).by(1)
      end

      it "redirects to the created cart" do
        post carts_url, params: { cart: valid_attributes }
        expect(response).to redirect_to(cart_url(Cart.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cart" do
        expect {
          post carts_url, params: { cart: invalid_attributes }
        }.to change(Cart, :count).by(0)
      end

    
      it "renders a successful response (i.e. to display the 'new' template)" do
        post carts_url, params: { cart: invalid_attributes }
        expect(response).to be_successful
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cart" do
        cart = Cart.create! valid_attributes
        patch cart_url(cart), params: { cart: new_attributes }
        cart.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the cart" do
        cart = Cart.create! valid_attributes
        patch cart_url(cart), params: { cart: new_attributes }
        cart.reload
        expect(response).to redirect_to(cart_url(cart))
      end
    end

    context "with invalid parameters" do
    
      it "renders a successful response (i.e. to display the 'edit' template)" do
        cart = Cart.create! valid_attributes
        patch cart_url(cart), params: { cart: invalid_attributes }
        expect(response).to be_successful
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cart" do
      cart = Cart.create! valid_attributes
      expect {
        delete cart_url(cart)
      }.to change(Cart, :count).by(-1)
    end

    it "redirects to the carts list" do
      cart = Cart.create! valid_attributes
      delete cart_url(cart)
      expect(response).to redirect_to(carts_url)
    end
  end
end
