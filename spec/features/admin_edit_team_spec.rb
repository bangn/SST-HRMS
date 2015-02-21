require 'spec_helper'

describe "Admin edit team" do
  let!(:admin) {FactoryGirl.create(:admin)}
  let!(:team) {FactoryGirl.create(:team, :name => "Test")}
  
  before :each do
    admin.confirm!
    sign_in_as! admin
  end
  
  it "should update team name" do
    click_link "TEAMS"
    click_link team.name
    
    fill_in "Name", :with => "Edit Test"
    
    click_button "SUBMIT"
    
    expect(page).to have_content("Team has been updated successfully!")
    expect(page).to have_content("Edit Test")
  end
  
  it "should not update team name if it is too short" do
    click_link "TEAMS"
    click_link team.name
    
    fill_in "Name", :with => "TS"
    
    click_button "SUBMIT"
    expect(page).to have_content("Name is too short")
    
    click_link "TEAMS"
    expect(page).to have_content("Error when updating team. Please try again")
  end
end