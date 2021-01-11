require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    it "全ての項目の入力が存在すれば登録できること" do
      expect(@user).to be_valid
    end

  describe "ユーザー新規登録" do
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "一意性のないemailでは登録できない" do
      @user.save
      user_b = FactoryBot.build(:user)
      user_b.email = @user.email
      user_b.valid?
      expect(user_b.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは６文字以上の半角英数字でないと登録できない" do
    end

    it "encrypted_passwordはpasswordと同じでないと登録できない" do
    end

    it "last_nameがないと登録できない" do
    end

    it "first_nameがないと登録できない" do
    end

    it "kana_last_nameがないと登録できない" do
    end

    it "kana_first_nameがないと登録できない" do
    end

  end
end
