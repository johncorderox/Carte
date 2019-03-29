class SettingsController < ApplicationController
  before_action :set_menu, only: [:show]

  def show
    @errors = Log.where(menu_id: @menu.id).where(code: 404)
    add_profile_views_count(@menu.id)
  end

  private

    def set_menu
      @menu = Menu.find(params[:id])
    end
end
