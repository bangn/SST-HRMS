require 'spec_helper'

describe "Admin edit user" do
  let!(:admin) {FactoryGirl.create(:admin)}
  let!(:user) {FactoryGirl.create(:user)}
  let!(:team_1) {FactoryGirl.create(:team, :name => "Truss")}
  let!(:team_2) {FactoryGirl.create(:team, :name => "Developer")}
  
  before :each do
    admin.confirm!
    user.confirm!
    
    sign_in_as!(admin)
  end
  
  it "should update user details" do
    click_link user.email
    fill_in "First name", :with => "simpson"
    fill_in "Last name", :with => "strongtie"
    
    click_button "SUBMIT"
    
    expect(page).to have_content "simpson strongtie"
  end
  
  it "should assign user to team" do
    click_link user.email
    select "Developer", :from => "Belongs to team"
    click_button "SUBMIT"
    
    expect(page).to have_content("Developer")
  end
end