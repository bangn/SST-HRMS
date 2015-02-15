require 'spec_helper'

describe "Admin create user" do
  let!(:admin) { FactoryGirl.create(:admin) }
  
  before :each do
    sign_in_as!(admin)
    click_link "Create new user"
  end
  
  it "should create new user" do
    fill_in "Email", with: "new_user@example.com"
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    
    click_button "Create"
    
    expect(page).to have_content("new_user@example.com")
  end

  it "should not create user with out email" do
    fill_in "Email", with: ""
    click_button "Create"

    byebug
    expect(page).to have_content "Email can't be blank"
  end
end
