require 'rails_helper'

RSpec.describe User, type: :model do

let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5") }
  let(:idea) { Idea.create(title: "Take over the world", description: "Inspired by Pinky and Brain", user_id: 1, category_id: 1) }

  it "is associated with a idea" do
    valid_user = User.create(username: "Sunshine")
    expect(valid_user.username).to eq("Sunshine")
  end

end
