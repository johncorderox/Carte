class LogsController < ApplicationController

  def show
    @menu = Menu.find(params[:id])
    @logs = Log.find_menu_logs(params[:id])
  end

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end
end
