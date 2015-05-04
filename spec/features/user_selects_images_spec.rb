require 'rails_helper'

RSpec.describe "adds images to ideas", type: :feature do

  let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5", role: "admin") }

  before(:example) do
    valid_user
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunshine")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
  end

  it "allows user to add an image" do
    Image.create(name: "Puppy", url: "http://images2.fanpop.com/image/photos/9700000/Sad-Puppy-puppies-9726248-1600-1200.jpg")
    visit new_idea_path
    select('Puppy', from: "idea[image_id]")
    click_link_or_button "Create"
    expect(page).to have_content("")
  end

end