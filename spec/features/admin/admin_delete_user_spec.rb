require 'spec_helper'

describe "Admin delete user" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user_2) { FactoryGirl.create(:user) }
  
  before :each do
    admin.confirm!
    user.confirm!
    user_2.confirm!
    sign_in_as!(admin)
  end
  
  it "should delete user", :js => true do
    page.find("#delete-resource-#{user.id}").click
    page.find("#delete-confirm").click

    expect(page).not_to have_content("#{user.email}")
    expect(page).to have_content("#{user_2.email}")
    expect(page).to have_content("User has been deleted successfully!")
  end
  
  it "should not delete its own", :js => true do
    page.find("#delete-resource-#{admin.id}").click
    page.find("#delete-confirm").click
    
    expect(page).to have_content("You can't delete yourself!")
  end
end
