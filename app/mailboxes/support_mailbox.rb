class SupportMailbox < ApplicationMailbox
  def process
    email_ = JSON.parse(mail.from.to_s).split("").join
    recent_order = Order.where(email: email_)
                        .order('created_at desc')
                        .first

    SupportRequest.create!(
      email: email_,
      subject: mail.subject,
      body: mail.body.to_s,
      order: recent_order
    )
  end
end
