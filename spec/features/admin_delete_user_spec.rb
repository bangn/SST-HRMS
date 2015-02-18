require 'spec_helper'

describe "Admin delete user" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  
  before :each do
    sign_in_as!(admin)
  end
  
  it "should delete user", :js => true do
    page.find("#user-#{user.id}").click
    page.accept_alert "Are you sure you want to delete #{user.email}?"

    expect(page).not_to have_content("#{user.email}")
  end
  
  it "should not delete its own account", :js => true do
    page.find("#user-#{admin.id}").click
    page.accept_alert "Are you sure you want to delete #{admin.email}?"

    expect(page).to have_content("#{admin.email}")
    expect(page).to have_content("You can't delete your self")
  end
end
