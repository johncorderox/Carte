class HeaderService

  def initialize(params)
    @name = params[:name]
    @menu_id = params[:menu_id]
  end

  def call
    Header.new(name: @name, menu_id: @menu_id)
  end

end
