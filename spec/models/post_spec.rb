require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @user = User.create(email: "test@gmail.com", password: "asdfasdf",
                          password_confirmation: "asdfasdf", first_name: "kevin", last_name: "Chang")
      @post = Post.create(date: Date.today, rationale: "Anything", user_id: @user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be create without date and rationale" do
      @post.date = nil
      @post.rationale = nil

      expect(@post).not_to be_valid
    end
  end
end
