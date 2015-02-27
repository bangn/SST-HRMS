require 'spec_helper'

describe "User edit profile" do
  let!(:user) {FactoryGirl.create(:user)}
  
  before :each do
    user.confirm!
    sign_in_as!(user)
  end
  
  it "should change her/his profile" do
    click_link "PROFILE"
    fill_in "First name", with: "user_first_name"
    fill_in "Last name", with: "user_last_name"
    
    click_button "SAVE"

    expect(page).to have_content("Your profile has been updated successfully!")
    user.reload
    user.first_name.should == "user_first_name"
    user.last_name.should == "user_last_name"
  end
end