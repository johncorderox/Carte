require 'rails_helper'

RSpec.describe MenusController do

    before(:each) do
      sign_in User.create(email: "admin@admin.com", password: "password")
    end

  describe "when a user views the menu INDEX" do
    it "renders the index view of menus" do
      get :index
      response.should render_template(:index)
    end
    it "should return status code of 200" do
      expect(response.status).to eq(200)
    end
  end





end
