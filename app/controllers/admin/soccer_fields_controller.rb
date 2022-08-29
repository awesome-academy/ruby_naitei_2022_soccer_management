class Admin::SoccerFieldsController < Admin::BaseController
  def new
    @soccer_field = SoccerField.new
  end

  def show
    @soccer_field = SoccerField.find_by id: params[:id]
    return if @soccer_field

    flash[:danger] = t(".not_found")
    redirect_to admin_root_path
  end

  def create
    @soccer_field = SoccerField.new(soccer_field_params)
    if @soccer_field.save
      flash[:success] = t ".success"
      redirect_to admin_soccer_field_path(@soccer_field)
    else
      flash.now[:danger] = t ".failed"
      render :new
    end
  end

  private
  def soccer_field_params
    params.require(:soccer_field).permit(:name, :address, :field_type,
                                         :rate, :hour_price)
  end
end
