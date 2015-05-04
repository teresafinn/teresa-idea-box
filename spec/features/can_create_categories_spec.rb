require 'rails_helper'

RSpec.describe "categories feature", type: :feature do

 let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5", role: "admin") }

  before(:example) do
    valid_user
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunshine")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
  end

  it "allows categories to be created" do
    visit new_category_path
    fill_in("category[group]", with: "Master Plan")
    click_link_or_button "Add Category"
    expect(page).to have_content("Master Plan")
  end

  it "allows categories to be deleted" do
    visit new_category_path
    fill_in("category[group]", with: "Master Plan")
    click_link_or_button "Add Category"
    click_link_or_button "Delete"
    expect(page).to_not have_content("Master Plan")
  end



end