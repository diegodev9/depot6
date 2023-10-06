# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  pay_type   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'pago'

class Order < ApplicationRecord
  enum pay_type: {
    "Check": 0,
    "Credit card": 1,
    "Purchase order": 2
  }

  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def charge!(pay_type_params)
    payment_details_ = {}
    payment_method_ = nil

    case pay_type
    when 'Check'
      payment_method_ = :check
      payment_details_[:routing] = pay_type_params[:routing_number]
      payment_details_[:account] = pay_type_params[:account_number]
    when 'Credit card'
      payment_method_ = :credit_card
      month, year = pay_type_params[:expiration_date].split(//)
      payment_details_[:cc_number] = pay_type_params[:credit_card_number]
      payment_details_[:expiration_month] = month
      payment_details_[:expiration_year] = year
    when 'Purchase order'
      payment_method_ = :po
      payment_details_[:po_num] = pay_type_params[:po_number]
    end

    payment_result = Pago.make_payment(order_id: id, payment_method: payment_method_, payment_details: payment_details_)

    raise payment_result.error unless payment_result.succeeded?

    OrderMailer.received(self).deliver_later if payment_result.succeeded?
  end
end
