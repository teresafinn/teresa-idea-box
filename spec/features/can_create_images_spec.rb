require 'rails_helper'

RSpec.describe "images feature", type: :feature do

let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5", role: "admin") }

  before(:example) do
    valid_user
    visit login_path
    fill_in("arbitrary_session_username", with: "Sunshine")
    fill_in("arbitrary_session_password", with: "unicorn5")
    click_link_or_button "Sign in"
  end

  it "allows images to be created" do
    visit new_image_path
    fill_in("image[name]", with: "Puppy")
    fill_in("image[url]", with: "http://images2.fanpop.com/image/photos/9700000/Sad-Puppy-puppies-9726248-1600-1200.jpg")
    click_link_or_button "Add Image"
    expect(page).to have_content("Puppy") #image index page
  end

  it "allows images to be deleted" do
    visit new_image_path
    fill_in("image[name]", with: "Puppy")
    fill_in("image[url]", with: "http://images2.fanpop.com/image/photos/9700000/Sad-Puppy-puppies-9726248-1600-1200.jpg")
    click_link_or_button "Add Image"
    click_link_or_button "Delete"
    expect(page).to_not have_content("Puppy") #image index page
  end



end