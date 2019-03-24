class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def create_new_header_log(header)
    Log.create(description: "Header Created", status: "Success", code: 200, menu_id: header.menu_id, user_id: current_user.id)
  end

  def create_destroy_header_log(header)
    Log.create(description: "Header - #{header.name} - was deleted", status: "Success", code: 200, menu_id: header.menu_id, user_id: current_user.id)
  end

  def create_destroy_header_error_log(header)
    Log.create(description: "Header could not be created", status: "Error", code: 404, menu_id: header.menu_id, user_id: current_user.id)
  end

  def create_downloaded_file_log(menu)
    Log.create(description: "A User - #{current_user.email} downloaded notes from the Menu - #{menu.name}", status: "Pass", code: 200, menu_id: menu.id, user_id: current_user.id)
  end

  def add_profile_views_count(menu_id)
    Menu.find(menu_id).increment!(:page_views)
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
