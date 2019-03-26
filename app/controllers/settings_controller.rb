class SettingsController < ApplicationController
  before_action :set_menu, only: [:show]

  def show
  end

  private

    def set_menu
      @menu = Menu.find(params[:id])
    end
end
