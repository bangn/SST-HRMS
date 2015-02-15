require "spec_helper"

describe "User sign in" do
  it "should not log incorrect user in" do
    visit "/users/sign_in"
    fill_in "Email", with: "not_a_member@strongtie.com"
    fill_in "Password", with: "password"

    click_button "SIGN IN"

    expect(page).to have_content("Invalid email or password")
  end
end
