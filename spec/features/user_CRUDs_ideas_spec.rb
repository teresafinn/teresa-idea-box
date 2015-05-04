require 'rails_helper'

RSpec.describe "the user CRUD features", type: :feature do

  let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5", role: "admin") }

  before(:example) do
    valid_user
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunshine")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
  end

  it "allow user to link to create page" do
    visit user_path(valid_user)
    expect(page).to have_content("Create New Idea")
  end

  it "allows user to create a new idea" do
    visit user_path(valid_user)
    click_link_or_button "Create New Idea"
    expect(page).to have_content("Please enter your idea:")
  end

  it "allows newly created ideas to show up on user page" do
    visit new_idea_path
    fill_in("idea[title]", with: "Take over the world")
    fill_in("idea[description]", with: "Inspired by Pinky and Brain")
    click_link_or_button "Create"
    expect(page).to have_content("Take over the world")
  end

  it "allows user to edit ideas" do
    visit new_idea_path
    fill_in("idea[title]", with: "Take over the world")
    fill_in("idea[description]", with: "Inspired by Pinky and Brain")
    click_link_or_button "Create"
    click_link_or_button "Edit"
    fill_in("idea[title]", with: "Take over Canada")
    click_link_or_button "Update"
    expect(page).to have_content("Take over Canada")
  end

  it "allows user to delete ideas" do
    visit new_idea_path
    fill_in("idea[title]", with: "Take over the world")
    fill_in("idea[description]", with: "Inspired by Pinky and Brain")
    click_link_or_button "Create"
    click_link_or_button "Delete"
    expect(page).to_not have_content("Take over the world")
  end

end