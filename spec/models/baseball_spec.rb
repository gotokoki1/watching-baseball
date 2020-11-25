require 'rails_helper'

RSpec.describe Baseball, type: :model do
  before do
    @baseball = FactoryBot.build(:baseball)
  end

  describe '募集投稿機能' do
    it 'タイトルが必須出あること' do
      @baseball.title = nil
      @baseball.valid?
      expect(@baseball.errors.full_messages).to include("Title can't be blank")
    end

    it '募集内容が必須であること' do
      @baseball.content = nil
      @baseball.valid?
      expect(@baseball.errors.full_messages).to include("Content can't be blank")
    end

    it '好きな球団の情報が1では登録できない' do
      @baseball.like_team_id = 1
      @baseball.valid?
      expect(@baseball.errors.full_messages).to include("Like team must be other than 1")
    end
  end
end
