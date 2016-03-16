class OffersController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_OFFER
    @offers = Offer.active.page params[:page]
  end

  def show
    @hover_menu = CONSTANT_MENU_OFFER
    @offer = Offer.find(params[:id])
  end

end