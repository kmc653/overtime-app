require 'rails_helper'

describe "navigate" do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  context "index" do
    before do
      visit posts_path
    end

    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "has a title of Post" do
      expect(page).to have_content(/Post/)
    end

    it "has a list of posts" do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)

      visit posts_path
      expect(page).to have_content(/rationale|content/)
    end
  end
  context "creation" do
    before do
      visit new_post_path
    end

    it "has a new form can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some rationale"

      click_on "Save"
      expect(page).to have_content("Some rationale")
    end

    it "will have a user associated it" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end

  context "edit" do
    before do
      @post = FactoryGirl.create(:post)
    end
    it 'can be reached by clicking edit on idex page' do
      visit posts_path

      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end
  end

end
