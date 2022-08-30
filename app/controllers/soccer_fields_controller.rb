class SoccerFieldsController < ApplicationController
  def index
    @pagy, @soccer_fields = pagy(SoccerField.all,
                                 items: Settings.pagy.soccer_fields)
  end

  def show
    @soccer_field = SoccerField.find_by id: params[:id]
    return if @soccer_field

    flash[:error] = t ".not_found"
    redirect_to root_path
  end
end
