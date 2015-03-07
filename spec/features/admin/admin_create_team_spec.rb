require 'spec_helper'

describe "Admin create team" do
  let!(:admin) {FactoryGirl.create(:admin)}

  before :each do
    admin.confirm!
    sign_in_as! admin
  end

  it "should create new team" do
    click_link "TEAMS"
    click_link "Create new team"

    fill_in "Name", :with => "New Team"

    click_button "SAVE"

    expect(page).to have_content("New Team team has been created!")
    expect(page).to have_content("New Team")
  end
end
