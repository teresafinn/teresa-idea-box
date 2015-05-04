require 'rails_helper'

RSpec.describe "dropdown menu to categorizes ideas", type: :feature do

  let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5", role: "admin") }

  before(:example) do
    valid_user
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunshine")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
  end

  it "allows the user to select a category" do
    Category.create(group: "Master Plans")
    visit new_idea_path
    fill_in("idea[title]", with: "Take over the world")
    fill_in("idea[description]", with: "Inspired by Pinky and Brain")
    select('Master Plans', from: "idea[category_id]")
    click_link_or_button "Create"
    expect(page).to have_content("Master Plans")
  end

end
