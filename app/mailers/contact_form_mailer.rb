class ContactFormMailer < ApplicationMailer

  def new_message(name, email, tel, message)
    @name = name
    @email = email
    @tel = tel
    @message = message
    mail(subject: 'Nuevo mensaje desde mayacom.com.uy')
  end

end
