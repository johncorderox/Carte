class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def create_new_menu_log(menu)
    Log.create(description: "Menu Created", status: "Success", code: 200, menu_id: menu.id)
  end

  def destroy_new_menu_log(menu)
    Log.create(description: "Menu #{menu.name} was Deleted on #{Time.now.strftime("%B %d %Y - %l:%M %p")}", status: "Success", code: 200, menu_id: menu.id)
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys:
        [:email, :current_password, :location, :company, :bio, :industry
        ])
    end
end
