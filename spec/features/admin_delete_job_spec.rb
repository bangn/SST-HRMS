require 'spec_helper'

describe "Admin create jobs" do
  let!(:admin) {FactoryGirl.create(:admin)}

  before :each do
    admin.confirm!
    sign_in_as! admin
  end

  it "should create new job", :focus => true, :driver => :selenium do
    click_link "JOBS"
    click_link "Create new job"

    fill_in "Name", :with => "This is a new job"
    click_button "SUBMIT"
    
    page.find("#resource-1").click
    page.find("#delete-confirm").click
    
    expect(page).to have_content("Job has been deleted successfully!")    
    expect(page).not_to have_content("This is a new job")
  end
end
