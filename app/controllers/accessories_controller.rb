class AccessoriesController < ApplicationController

  def index
    @hover_menu = CONSTANT_MENU_ACCESORIOES
    @access_types = AccessType.all
    @search = Accessory.search(params[:q])
    @search.sorts = 'new_price asc' if @search.sorts.empty?
    @accessories = @search.result.page params[:page]
  end

  def show
    @accessory = Accessory.find(params[:id])
    @hover_menu = CONSTANT_MENU_ACCESORIOES
  end

end
