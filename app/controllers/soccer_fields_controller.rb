class SoccerFieldsController < ApplicationController
  def index
    @pagy, @soccer_fields = pagy(SoccerField.all,
                                 items: Settings.pagy.soccer_fields)
  end
end
