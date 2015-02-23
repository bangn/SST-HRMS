require 'spec_helper'

describe "Admin create jobs" do
  let!(:admin) {FactoryGirl.create(:admin)}
  let!(:team_1) {FactoryGirl.create(:team, :name => "Truss")}
  let!(:team_2) {FactoryGirl.create(:team, :name => "Developer")}

  before :each do
    admin.confirm!
    sign_in_as! admin
  end

  it "should update job" do
    click_link "JOBS"
    
    click_link "Create new job"
    fill_in "Name", :with => "This is a new job"
    click_button "SUBMIT"

    click_link "This is a new job"    
    fill_in "Name", :with => "This job is updated"
    click_button "SUBMIT"
    
    expect(page).to have_content("This job is updated")
    expect(page).to have_content("Job has been updated successfully!")
  end
end
