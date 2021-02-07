class InquiryMailer < ApplicationMailer
  
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: "a@a",
      to: "okadareo0614@gmail.com",
      subject: "お問合せ通知"
    )
  end
end
