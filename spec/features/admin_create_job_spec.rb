require 'spec_helper'

describe "Admin create jobs" do
  let!(:admin) {FactoryGirl.create(:admin)}
  let!(:team_1) {FactoryGirl.create(:team, :name => "Truss")}
  let!(:team_2) {FactoryGirl.create(:team, :name => "Developer")}

  before :each do
    admin.confirm!
    sign_in_as! admin
  end

  it "should create new job" do
    click_link "JOBS"
    click_link "Create new job"

    fill_in "Name", :with => "This is a new job"

    click_button "SUBMIT"
    
    expect(page).to have_content("This is a new job")
    expect(page).to have_content("New job has been created!")
  end
  
  it "should show error if end date presents but start date does not" do
    click_link "JOBS"
    click_link "Create new job"

    fill_in "Name", :with => "This is a new job"
    fill_in "End date", with: "24-02-2015"
    
    click_button "SUBMIT"
    
    expect(page).to have_content("Start date should be presented!")
  end
  
  it "should show error if end date is in the past of start date" do
    click_link "JOBS"
    click_link "Create new job"

    fill_in "Name", :with => "This is a new job"
    fill_in "Start date", with: "25-02-2015"
    fill_in "End date", with: "24-02-2015"
    
    click_button "SUBMIT"
    
    expect(page).to have_content("End date should be on the same day as start date or in the future")
  end
end
