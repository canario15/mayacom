class PhonesController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_PHONES
    @brands = Brand.all
    @search = Phone.search(params[:q])
    @search.sorts = 'new_price asc' if @search.sorts.empty?
    @phones = @search.result.page params[:page]
  end

  def show
    @phone = Phone.find(params[:id])
    @hover_menu = CONSTANT_MENU_PHONES
  end

end
