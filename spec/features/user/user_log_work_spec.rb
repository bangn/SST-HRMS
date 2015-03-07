require 'spec_helper'

describe 'User log work' do
  let!(:team) {FactoryGirl.create(:team, name: "Test team")}
  let!(:user) {FactoryGirl.create(:user, team: team)}
  let!(:opened_state) {FactoryGirl.create(:state, :name=> "Opened")}
  let!(:completed_state) {FactoryGirl.create(:state, :name=> "Completed")}
  let!(:job) {FactoryGirl.create(
    :job,
    team: team,
    name: "Test select job from dropdown",
    :state => State.OPENED.first
    )}
  
  before :each do
    user.confirm!
    sign_in_as!(user)
  end
  
  it "should create work log" do
    click_link "TIMESHEETS"
    click_link "Log work"

    select "Test select job from dropdown", from: "Jobs"
    fill_in "Description", with: "This is a test work log"
    fill_in "Duration", with: 2
    fill_in "Working date", with: "02-03-2015"
    
    click_button "SAVE"

    user.reload
    user.timesheets.first.job.should == job
    
    expect(page).to have_content("New work log has been created successfully!")
    expect(page).to have_content("This is a test work log")
  end
  
  it "should show error if date is blank" do
    click_link "TIMESHEETS"
    click_link "Log work"
    
    fill_in "Description", with: "This is a test work log"
    fill_in "Duration", with: 2
    fill_in "Working date", :with => ""
    click_button "SAVE"

    expect(page).to have_content("Working date can't be blank")
  end
  
  it "should show error if duration is zero" do
    click_link "TIMESHEETS"
    click_link "Log work"
    
    fill_in "Description", with: "This is a test work log"
    fill_in "Duration", with: 0
    fill_in "Working date", with: "02-03-2015"
    
    click_button "SAVE"
    
    expect(page).to have_content("Duration must be greater than 0")
  end
end