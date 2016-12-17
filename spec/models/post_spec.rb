require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post)
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
