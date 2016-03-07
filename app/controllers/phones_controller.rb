class PhonesController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_PHONES
    @brands = Brand.all
    @search = Phone.search(params[:q])
    @phones = @search.result
  end

  def show
    @phone = Phone.find(params[:id])
    @hover_menu = CONSTANT_MENU_PHONES
  end

end
