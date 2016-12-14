require 'rails_helper'

describe "navigate" do
  context "index" do
    it "can be reached successfully" do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it "has a title of Post" do
      visit posts_path
      expect(page).to have_content(/Post/)
    end
  end
  context "creation" do
    before do
      user = User.create(email: "test@gmail.com", password: "asdfasdf",
                          password_confirmation: "asdfasdf", first_name: "kevin", last_name: "Chang")
      login_as(user, :scope => :user)
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

end
