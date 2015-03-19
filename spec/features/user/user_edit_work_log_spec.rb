require 'spec_helper'

describe 'User edit work log' do
  let!(:user) {FactoryGirl.create(:user)}
  
  before :each do
    user.confirm!
    sign_in_as!(user)
  end
  
  it "should update work log" do
    click_link "TIMESHEETS"
    click_link "Log work"
    
    fill_in "Description", with: "This is a test work log"
    fill_in "Duration", with: 2
    fill_in "Working date", with: "02-03-2015"
    click_button "SAVE"
    
    find("#edit-timesheet-1").click
    fill_in "Description", with: "This work log has been updated"
    click_button "SAVE"
    
    expect(page).to have_content("Work log has been updated successfully!")
    expect(page).to have_content("This work log has been updated")
  end
end
