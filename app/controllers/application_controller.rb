class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :full_firstname, :full_lastname, :kana_firstname, :kana_lastname, :birth_date])
  end
end
