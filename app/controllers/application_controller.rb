class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  protect_from_forgery with: :exception
  include SessionsHelper
  include GamesHelper
  include Banken
  include Redcarpet
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    loyalty_name = exception.loyalty.class.to_s.underscore

    flash[:danger] = t "#{loyalty_name}.#{exception.query}", scope: "banken", default: :default
    redirect_to(request.referrer || admin_menu_path)
  end
end
