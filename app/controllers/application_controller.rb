class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def create_new_menu_log(menu)
    Log.create(description: "Menu Created", status: "Success", code: 200, menu_id: menu.id)
  end

  def after_sign_up_path_for(resource)
   menus_path
 end

 def after_sign_in_path_for(resource)
   menus_path
 end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys:
        [:email, :current_password, :location, :company, :bio, :industry
        ])
    end
end
