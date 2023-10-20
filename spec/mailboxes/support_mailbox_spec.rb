require 'rails_helper'
require 'support/database_cleaner'

RSpec.describe SupportMailbox, type: :mailbox do
  include ActionMailbox::TestHelper

  it 'Creates a SupportRequest when we get a support email' do
    receive_inbound_email_from_mail(
      to: 'support@example.com',
      from: 'chris@somehwere.net',
      subject: 'Need help',
      body: "I can't figure out how to check out!!"
    )

    support_request = SupportRequest.last

    expect(support_request.email).to match('chris@somehwere.net')
    expect(support_request.subject).to match('Need help')
    expect(support_request.body).to match("I can't figure out how to check out!!")
    expect(support_request.order).to be_nil
  end

  it 'creates a SupportRequest with the most recent order' do
    recent_order = FactoryBot.create(:order, name: 'Juan Perez', address: 'mi casa', email: 'juan@perez.com')
    older_order = FactoryBot.create(:order, name: 'Juan Perez', address: 'mi casa', email: 'juan@perez.com', created_at: 2.days.ago)
    non_customer = FactoryBot.create(:order, name: 'Pepito Juarez', address: 'casita blanca', email: 'pepito@juarez.com', created_at: 1.day.ago)

    receive_inbound_email_from_mail(
      to: 'support@example.com',
      from: recent_order.email,
      subject: 'Need help',
      body: "I can't figure out how to check out!!"
    )

    support_request = SupportRequest.last
    recent_order
    older_order
    non_customer

    expect(support_request.email).to match(recent_order.email)
    expect(support_request.subject).to match('Need help')
    expect(support_request.body).to match("I can't figure out how to check out!!")
    expect(support_request.order).to match(recent_order)
  end
end
