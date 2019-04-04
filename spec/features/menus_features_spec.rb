require 'rails_helper'
feature "User creates an account" do
  scenario "successfully creates a new user account" do
    visit new_user_registration_path
     fill_in "Email", with: "john@john.com"
     fill_in "Password", with: "Password123"
     fill_in "user[password_confirmation]", with: "Password123"
     click_button "Sign up"
     expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
