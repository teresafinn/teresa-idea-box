require 'rails_helper'

RSpec.describe "the user authentication feature", type: :feature do

  let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5") }

  it "allows a valid user to log in" do
    valid_user
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunshine")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
    expect(page).to have_content("Welcome to your ideas page, Sunshine!")
  end

  it "prevents an invalid user from logging in" do
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunny")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
    expect(page).to have_content("Invalid login.")
  end

  it "lists user ideas after authenticating" do
    valid_user
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunshine")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
    Idea.create(title: "Take over the world", description: "Inspired by Pinky and Brain", user_id: 1)
    visit user_path(valid_user)
    expect(page).to have_content("Take over the world")
  end

end

