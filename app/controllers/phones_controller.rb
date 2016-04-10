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

  def compare
    @phones = Phone.all
    @hover_menu = CONSTANT_MENU_PHONES
  end

  def spec_comp
    @phone = nil
    @phone = Phone.find(params[:phone_id]) unless params[:phone_id].blank?
    respond_to do |format|
      if request.xhr?
        format.html { render partial: 'spec_comp', :layout => false}
      else
        format.html
      end
    end
  end

end
