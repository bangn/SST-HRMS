require 'spec_helper'

describe "Admin update user detail" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:user) { FactoryGirl.create(:user) }
  
  before :each do
    sign_in_as!(admin)
    click_link user.email
  end
  
  it "should update details without providing new password" do
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"

    click_button "SUBMIT"

    expect(page).to have_content("First Last")
  end
end
