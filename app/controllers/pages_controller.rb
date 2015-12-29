class PagesController < ApplicationController

  def home
    @hover_menu = CONSTANT_MENU_HOME_ID
  end

  def accesories
    @hover_menu = CONSTANT_MENU_ACCESORIOES
  end

  def contract
    @hover_menu = CONSTANT_MENU_CONTRACTS
  end

  def ofert
    @hover_menu = CONSTANT_MENU_OFFER
  end

  def contact
    @hover_menu = CONSTANT_MENU_CONTACT_ID
  end

end