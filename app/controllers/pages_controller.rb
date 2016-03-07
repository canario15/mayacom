class PagesController < ApplicationController

  def home
    @hover_menu = CONSTANT_MENU_HOME_ID
  end

  def ofert
    @hover_menu = CONSTANT_MENU_OFFER
    @offers = Offer.active
  end

  def contact
    @hover_menu = CONSTANT_MENU_CONTACT_ID
  end

end