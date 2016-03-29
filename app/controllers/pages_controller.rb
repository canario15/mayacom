class PagesController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def home
    @hover_menu = CONSTANT_MENU_HOME_ID
    @last_phones = Phone.last(5)
    @last_access = Accessory.last(5)
    @top_viwes = Phone.where(is_most_view: true).last(3)
    @top_sell = Phone.where(is_top_sale: true).last(3)
    @top_news = Phone.where(is_top_new: true).last(3)
    @offers = Offer.where(active: true).last(4)
  end

  def contact
    @hover_menu = CONSTANT_MENU_CONTACT_ID
  end

  def send_contact_info
    @name = params[:name]
    @email = params[:email]
    @phone = params[:tel]
    @message = params[:message]
    ContactFormMailer.new_message(@name,@email,@phone,@message).deliver_later
    flash[:success] = "Su mensaje ha sido enviado correctamente"
    redirect_to contacto_path
  end

  def en_construccion

    respond_to do |format|
      format.html { render partial: 'en_construccion', :layout => false}
    end

  end

end