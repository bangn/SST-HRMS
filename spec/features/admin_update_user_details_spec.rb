require 'spec_helper'

describe "Admin update details" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  
  before :each do
    sign_in_as!(admin)
  end
  
  it "should be able update user details without providing new password" do
    click_link user.email
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"

    click_button "SUBMIT"

    expect(page).to have_content("First Last")
  end

  it "should disable email field" do
    click_link user.email
    page.find("#user_email").should be_disabled
  end
  
  it "should not be able to update its own role" do
    click_link admin.email
    page.find("#user_admin").should be_disabled
  end
end
