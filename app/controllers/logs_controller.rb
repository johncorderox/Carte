class LogsController < ApplicationController

  def show
    @menu = Menu.find(params[:id])
    @logs = Log.where(menu_id: params[:id])
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
