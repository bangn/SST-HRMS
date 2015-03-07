require 'spec_helper'

describe "User" do
  let!(:team) {FactoryGirl.create(:team)}
  let!(:state_opened) {FactoryGirl.create(:state, name: "Opened")}
  let!(:state_inprogress) {FactoryGirl.create(:state, name: "In Progress")}
  let!(:state_completed) {FactoryGirl.create(:state, name: "Completed")}
  let!(:job1) {FactoryGirl.create(:job, team: team, state: state_opened)}
  let!(:job2) {FactoryGirl.create(:job, team: team, state: state_inprogress)}
  let!(:job3) {FactoryGirl.create(:job, team: team, :start_date => "07-03-2015", :end_date => "07-03-2015", state: state_completed)}
  let!(:user) { FactoryGirl.create(:user, team: team) }
  let!(:user2) {FactoryGirl.create(:user)}
  it "should return appropriate available jobs for user" do
    user.available_jobs.should == [job1, job2]
    user2.available_jobs.should == nil
  end
end