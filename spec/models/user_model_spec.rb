require 'spec_helper'

describe "User" do
  let!(:team) {FactoryGirl.create(:team)}
  let!(:job1) {FactoryGirl.create(:job, team: team)}
  let!(:job2) {FactoryGirl.create(:job, team: team)}
  let!(:user) { FactoryGirl.create(:user, team: team) }
  let!(:user2) {FactoryGirl.create(:user)}
  it "should return appropriate available jobs for user" do
    user.available_jobs.should == [job1, job2]
    user2.available_jobs.should == nil
  end
end