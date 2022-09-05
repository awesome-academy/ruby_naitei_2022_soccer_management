class Admin::SoccerFieldOrdersController < Admin::BaseController
  def index
    @pagy, @soccer_field_orders = pagy(SoccerFieldOrder.all,
                                       items: Settings.pagy.soccer_field_orders)
  end
end
