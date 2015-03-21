require 'spec_helper'

describe "User delete work log" do
  let!(:user) {FactoryGirl.create(:user)}
  
  before :each do
    user.confirm!
    sign_in_as!(user)
  end
  
  it "should delete work log", js: true do
    click_link "TIMESHEETS"
    click_link "Log work"
    
    fill_in "Description", with: "This log will be deleted"
    fill_in "Duration", with: 2
    fill_in "Working date", with: "02-03-2015"
    
    click_button "SAVE"
    
    find("#delete-timesheet-1").click
    find('#delete-confirm').click
    
    expect(page).to have_content("Work log has been deleted successfully!")
    expect(page).not_to have_content("This log will be deleted")
  end
end
