require 'spec_helper'

describe 'User log work' do
  let!(:team) {FactoryGirl.create(:team, name: "Test team")}
  let!(:user) {FactoryGirl.create(:user, team: team)}
  
  before :each do
    user.confirm!
    sign_in_as!(user)
  end
  
  it "should create leave log" do
    click_link "LEAVES"
    click_link "Add leave"

    fill_in "Leave date", with: "23-03-2015"
    fill_in "Duration", with: 8
    select "Annual", from: "Type"
    fill_in "Reason", with: "Test leave"

    click_button "SEND"

    user.reload
    user.leaves.first.leave_type.should == "annual"
    binding.pry
    user.leaves.first.leave_date.to_s.should =~ /2015-03-23/
    user.leaves.first.duration.should == 8
    
    expect(page).to have_content("New leave has been created successfully!")
    expect(page).to have_content("Test leave")
  end
end
