require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do
      @post = FactoryBot.create(:post)
    end
    it 'can be created' do
      expect(@post).to be_valid
    end
    it 'can not be created without a date or rationale' do
      @post.date = nil
      @post.rationale = nil
      @post.user_id = nil
      expect(@post).not_to be_valid
    end
  end
end
