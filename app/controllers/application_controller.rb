class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :full_firstname, :full_lastname, :kana_firstname, :kana_lastname, :birth_date])
  end

  private
  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
