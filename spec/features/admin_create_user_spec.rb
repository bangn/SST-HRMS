require 'spec_helper'

describe "Admin create user" do
  let!(:admin) { FactoryGirl.create(:admin) }
  it "should create new user" ,focus: true, driver: :selenium do
    sign_in_as!(admin)
    click_link "Create new user"

    fill_in "Email", with: "new_user@example.com"
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    
    click_button "Create"
    
    expect(page).to have_content("new_user@example.com")
  end
end
