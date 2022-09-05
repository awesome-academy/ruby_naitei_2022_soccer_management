class SoccerFieldsController < ApplicationController
  before_action :logged_in_user, only: :show

  def index
    @pagy, @soccer_fields = pagy(SoccerField
                                  .search_name(params[:name])
                                  .search_address(params[:address]),
                                 items: Settings.pagy.soccer_fields)
  end

  def show
    @soccer_field = SoccerField.find_by id: params[:id]
    @soccer_field_order = current_user
                          .soccer_field_orders
                          .build(soccer_field_id: @soccer_field.id)

    return if @soccer_field

    flash[:error] = t ".not_found"
    redirect_to root_path
  end
end
