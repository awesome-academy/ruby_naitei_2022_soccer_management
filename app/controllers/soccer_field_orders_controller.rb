class SoccerFieldOrdersController < ApplicationController
  def new
    @soccer_field_order = SoccerFieldOrder.new
  end

  def create
    @soccer_field_order = current_user
                          .soccer_field_orders
                          .build(soccer_field_order_params)

    if check_order_exist? && @soccer_field_order.save
      flash[:success] = t ".success"
      redirect_to soccer_fields_path
    else
      flash[:error] = t ".error"
      redirect_to soccer_field_path(soccer_field_order_params[:soccer_field_id])
    end
  end

  private
  def soccer_field_order_params
    params.require(:soccer_field_order).permit(
      :time_start_picker,
      :time_finish_picker,
      :user_id,
      :soccer_field_id
    )
  end

  def check_order_exist?
    start_time = soccer_field_order_params[:time_start_picker]
    finish_time = soccer_field_order_params[:time_finish_picker]
    soccer_field_orders = @soccer_field_order.soccer_field.soccer_field_orders
    soccer_field_orders.each do |soccer_field_order|
      if (start_time >= soccer_field_order.time_start &&
        start_time < soccer_field_order.time_finish) ||
         (finish_time > soccer_field_order.time_start &&
         finish_time <= soccer_field_order.time_finish)
        return false
      end
    end
    true
  end
end
