require 'rails_helper'

RSpec.describe "the user authentication feature", type: :feature do
  let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5") }

    it "allows a valid user to log in" do
      valid_user
      visit login_path
      fill_in("arbitrary_session_username", with: "Sunshine")
      fill_in("arbitrary_session_password", with: "unicorn5")
      click_link_or_button "Sign in"
      expect(page).to have_content("Welcome, Sunshine!")
    end

    xit "prevents an invalid user from logging in" do

    end


end

