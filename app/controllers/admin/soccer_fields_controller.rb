class Admin::SoccerFieldsController < Admin::BaseController
  before_action :find_field, except: %i(index new create)

  def new
    @soccer_field = SoccerField.new
  end

  def index
    @pagy, @soccer_fields = pagy(SoccerField.all,
                                 items: Settings.pagy.soccer_fields)
  end

  def show; end

  def create
    @soccer_field = SoccerField.new(soccer_field_params)
    @soccer_field.image.attach(params[:soccer_field][:image])
    if @soccer_field.save
      flash[:success] = t ".success"
      redirect_to admin_soccer_field_path(@soccer_field)
    else
      flash.now[:danger] = t ".failed"
      render :new
    end
  end

  def edit; end

  def update
    if @soccer_field.update(soccer_field_params)
      flash[:success] = t ".success"
      redirect_to admin_soccer_field_path(@soccer_field)
    else
      flash[:danger] = t ".failed"
      render :edit
    end
  end

  def destroy
    if @soccer_field.destroy
      flash[:success] = t(".success")
    else
      flash[:danger] = t(".failed")
    end
    redirect_to admin_soccer_fields_path
  end

  private
  def soccer_field_params
    params.require(:soccer_field).permit(:name, :address, :field_type,
                                         :rate, :hour_price, :image)
  end

  def find_field
    @soccer_field = SoccerField.find_by id: params[:id]
    return if @soccer_field

    flash[:danger] = t(".not_found")
    redirect_to admin_root_path
  end
end
