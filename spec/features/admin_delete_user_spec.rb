require 'spec_helper'

describe "Admin delete user" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  
  before :each do
    sign_in_as!(admin)
  end
  
  it "should delete user", :js => true do
    page.find("#user-#{user.id}").click
    page.find("#delete-confirm").click

    expect(page).not_to have_content("#{user.email}")
  end
  
  it "should not have delete link for current user", :js => true do
    page.should_not have_css("#user-#{admin.id}")
  end
end
