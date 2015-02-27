require 'spec_helper'

describe "Admin update jobs" do
  let!(:admin) {FactoryGirl.create(:admin)}
  let!(:team_1) {FactoryGirl.create(:team, :name => "Truss")}
  let!(:team_2) {FactoryGirl.create(:team, :name => "Developer")}
  let!(:job) {FactoryGirl.create(:job, :team => team_1)}

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
  
  it "should update job which belongs to specific team" do
    click_link "JOBS"

    click_link job.name   
    fill_in "Name", :with => "This job is updated"
    select "Developer", :from => "Belongs to team"
    
    click_button "SUBMIT"
    
    expect(page).to have_content("This job is updated")
    expect(page).to have_content("Job has been updated successfully!")
    
    job.reload
    click_link job.name
    expect(page).to have_select("job_team_id", :selected => "Developer")
  end
end
