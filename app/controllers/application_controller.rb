class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_locale, :check_role_user

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def check_role_user; end
end
