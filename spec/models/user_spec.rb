require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '登録できる時' do
    it "全ての項目の入力が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できる" do
      @user.password = "ppp000"
      @user.encrypted_password = "ppp000"
      expect(@user).to be_valid
    end

    it "encrypted_passwordはpasswordと同じであれば登録できる" do
     @user.password = "ppp000"
     @user.encrypted_password = "ppp000"
     expect(@user).to be_valid
    end

    it "passwordは半角英数字であれば登録できる" do
      @user.password = "ppp000"
      @user.encrypted_password = "ppp000"
      expect(@user).to be_valid
    end
  end

  context "登録できない時" do
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

    it "emailは＠が含まれていないと登録できない" do
      @user.email = "pp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは英字のみでは登録できない" do
      @user.password = "aaaaaa"
      @user.encrypted_password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordは数字のみでは登録できない" do
      @user.password = "000000"
      @user.encrypted_password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "last_nameがないと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameがないと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "kana_last_nameがないと登録できない" do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end


    it "kana_first_nameがないと登録できない" do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it "last_nameは数字では登録できない" do
      @user.last_name = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it "first_nameは数字では登録できない" do
      @user.first_name = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "last_nameは英字では登録できない" do
      @user.last_name = "pppppp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it "first_nameは英字では登録できない" do
      @user.first_name = "pppppp"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it "kana_last_nameは半角では登録できない" do
      @user.kana_last_name = "ｻﾄｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name Full-width katakana characters")
    end

    it "kana_first_nameは半角では登録できない" do
      @user.kana_first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name Full-width katakana characters")
    end

    it "birth_dayがないと登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end

