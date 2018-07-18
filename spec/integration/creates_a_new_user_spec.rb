require 'spec_helper'
require 'rails_helper'

feature "creates a new user" do 
	scenario "successfully creates a new user" do 
		visit root_path
		click_link "sign up"
		fill_in "user_email", with: "sam@sam.com"
		fill_in "user_password", with: "sam123"
		click_button "Create User"

	end

feature "creates a new task"
	scenario "successfully creates a new user" do 
		visit root_path
		click_link "sign up"
		fill_in "user_email", with: "sam@sam.com"
		fill_in "user_password", with: "sam123"
		click_button "Create User"

	end

end 

