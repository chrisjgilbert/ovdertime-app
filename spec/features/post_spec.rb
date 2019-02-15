require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq 200
    end

    it 'has a title of posts' do
      expect(page).to have_content 'Post'
    end
  end

  describe 'creation' do
    before do
      user = User.create(first_name: "Jon", last_name: "Snow", email: "test@test.com", password: "secret", password_confirmation: "secret")
      login_as(user, :scope => :user)
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq 200
    end

    it 'can be created from new for page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'save'
      expect(page).to have_content('Some rationale')
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User_Association'
      click_on 'save'
      expect(User.last.posts.last.rationale).to eq 'User_Association'
    end
  end
end
