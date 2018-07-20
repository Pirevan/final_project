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
end

feature "logs in" do 
	scenario "successfully creates a new user and logs in" do 
		visit root_path
		click_link "sign up"
		fill_in "user_email", with: "sam@sam.com"
		fill_in "user_password", with: "sam123"
		click_button "Create User"
		visit root_path
		expect(page).to have_link("sign out")

	end	
end

feature "creates a new task" do
	scenario "successfully creates a new task" do 
		visit root_path
		click_link "sign up"
		fill_in "user_email", with: "sam@sam.com"
		fill_in "user_password", with: "sam123"
		click_button "Create User"
		click_link "create new tasks"
		fill_in "task_task", with: "test"
		fill_in "task_remarks", with: "test"
		fill_in "task_start_date", with: Date.today+1
		fill_in "task_end_date", with: Date.today+2
		click_button "Create Task"

	end

end 

