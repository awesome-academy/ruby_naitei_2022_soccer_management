class SoccerFieldsController < ApplicationController
  def index
    @pagy, @soccer_fields = pagy(SoccerField
                                  .search_name(params[:name])
                                  .search_address(params[:address]),
                                 items: Settings.pagy.soccer_fields)
  end
end
