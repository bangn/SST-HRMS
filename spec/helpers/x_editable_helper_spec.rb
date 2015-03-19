require 'spec_helper'

describe "XEditableHelper" do
  let!(:team) {FactoryGirl.create(:team)}
  let!(:admin) {FactoryGirl.create(:admin, first_name: "admin", team: team)}
  let!(:user) {FactoryGirl.create(:user, first_name: "a name", team: team)}
  let!(:job) {FactoryGirl.create(:job, team: team)}
  let!(:timesheet) {FactoryGirl.create(:timesheet, user: user, job: job)}
  it "should generate content tag with span as default container" do
    helper.x_editable([admin,user], :first_name).should == content_tag(:span,
                                                               user.first_name,
                                                               "data-xeditable" => true,
                                                               "data-pk" => user.id,
                                                               "data-model" => "user",
                                                               "data-name" => "first_name",
                                                               "data-url" => polymorphic_path([admin, user], format: :json)
                                                              )
  end
  it "should generate content tag with correct data type" do
    helper.x_editable([admin,user], :first_name, as: :text).should == content_tag(:span,
                                                               user.first_name,
                                                               "data-xeditable" => true,
                                                               "data-pk" => user.id,
                                                               "data-model" => "user",
                                                               "data-name" => "first_name",
                                                               "data-url" => "",
                                                               "data-url" => polymorphic_path([admin, user], format: :json),
                                                               "data-type" => "text"
                                                              )
  end
end
