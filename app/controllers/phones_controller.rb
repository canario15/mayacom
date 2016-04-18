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
    @contracts = @phone.contracts
    @only_phone = true
  end

  def compare
    @phone = Phone.find_by_id(params[:phone_id]) unless params[:phone_id].blank?
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

  def plan_info
    @plan = Plan.find(params[:plan_id])
    @phone = Phone.find(params[:phone_id])
    @phone_plan = @phone.phone_plans.find_by(plan_id: @plan.id)
    respond_to do |format|
      format.html { render partial: 'plan_info', :layout => false }
    end
  end

  def contracts_plans
    @phone = Phone.find(params[:phone_id])
    if params[:contract_id] == '0'
      @contracts = @phone.contracts
      @only_phone = true
    else
      if params[:contract_id] == '99'
        @contracts = {}
        @only_phone = true
      else
        @contracts = []
        @contracts << @phone.contracts.detect{|c| c.id.to_s == params[:contract_id]}
        @only_phone = false
      end
    end
    respond_to do |format|
      format.html { render partial: 'contracts_plans', :layout => false }
    end
  end

end
