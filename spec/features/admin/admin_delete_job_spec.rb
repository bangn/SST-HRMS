require 'spec_helper'

describe "Admin delete jobs" do
  let!(:admin) {FactoryGirl.create(:admin)}

  before :each do
    admin.confirm!
    sign_in_as! admin
  end

  it "should delete job", :js => true do
    click_link "JOBS"
    click_link "Create new job"

    fill_in "Name", :with => "This is a new job"
    click_button "SUBMIT"
    
    page.find("#delete-resource-1").click
    page.find("#delete-confirm").click

    expect(page).to have_content("Job has been deleted successfully!")    
    expect(page).not_to have_content("This is a new job")
  end
end
