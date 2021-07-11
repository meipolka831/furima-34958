require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end

    context '登録できる場合' do

      it "nickname,email,password,password_confirmation,surname,name,surnamekana,namekana,birthday全てが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456abe7'
        @user.password_confirmation = '123456abe7'
        expect(@user).to be_valid
      end
    end

    context '登録出来ない場合' do
      
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

      it 'emailは@がないと登録出来ない' do
        @user.email = "aaaicloud.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '同じ名前のemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であると登録出来ない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confiremationが不一致では登録出来ない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは半角英語のみは登録出来ない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordは数字のみは登録出来ない' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordは全角英数混合は登録出来ない' do
        @user.password = "１１１aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "surnameが空だと登録できない" do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end

      it 'surnameは全角（漢字・ひらがな・カタカナ）以外は登録出来ない' do
        @user.surname = "surname"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname is invalid")
      end

      it "nameが空だと登録出来ない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameは全角（漢字・ひらがな・カタカナ）以外は登録出来ない' do
        @user.name = "name"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end

      it "surnamekanaが空だと登録出来ない" do
        @user.surnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surnamekana can't be blank")
      end

      it 'surnamekanaは全角（カタカナ）以外は登録出来ない' do
        @user.surnamekana = "surnamekana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surnamekana is invalid")
      end

      it "namekanaが空だと登録出来ない" do
        @user.namekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Namekana can't be blank")
      end

      it 'namekanaは全角（カタカナ）以外は登録出来ない' do
        @user.namekana = "namekana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Namekana is invalid")
      end

      it "birthdayが空だと登録出来ない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end


  end
end
