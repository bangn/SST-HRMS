require "spec_helper"

describe UserMailer do
  describe "welcome email" do
    let(:user) {FactoryGirl.create(:user)}
    before(:all) do
      @email = UserMailer.welcome_to_strongtie(user)
    end

    it "should be set to be delivered to the email passed in" do
      @email.should deliver_to(user.email)
    end

    it "should contain the user's message in the mail body" do
      @email.should have_body_text(/Welcome to Simpson StrongTie Vietnam/)
    end

    it "should have the correct subject" do
      @email.should have_subject(/Welcome to Simpson StrongTie Vietnam!/)
    end
  end
end
