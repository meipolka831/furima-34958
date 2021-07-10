require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,surname,name,surnamekana,namekana,birthday全てが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "surnameが空だと登録できない" do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end

    it "nameが空だと登録出来ない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "surnamekanaが空だと登録出来ない" do
      @user.surnamekana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surnamekana can't be blank")
    end

    it "namekanaが空だと登録出来ない" do
      @user.namekana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Namekana can't be blank")
    end

    it "birthdayが空だと登録出来ない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
