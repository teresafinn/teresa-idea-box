require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:valid_user) { User.create(username: "Sunshine", password: "unicorn5") }
  let(:idea) { Idea.create(title: "Take over the world", description: "Inspired by Pinky and Brain", user_id: 1, category_id: 1) }

  it "is associated with a user" do
    valid_user
    idea
    expect(idea.user.username).to eq("Sunshine")
  end

  it "is associated with a category" do
    idea
    Category.create(group: "Master Plans")
    expect(idea.category.group).to eq("Master Plans")
  end

end
