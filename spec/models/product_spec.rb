require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "商品出品機能" do

    before do
      @product = FactoryBot.build(:product)
    end

    context '登録できる場合' do

      it "name,detail,status_id,area_id,burden_id,shipping_date_id,money,user_id全てが存在すれば登録できる" do
        expect(@product).to be_valid
      end


    end

    context '登録出来ない場合' do

      it "imageが空だと登録できない" do
        @product.image = ''
        @product.valid?
      end
      
      it "nameが空だと登録できない" do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it "detailが空だと登録できない" do
        @product.detail = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Detail can't be blank")
      end

      it "status_idが空だと登録できない" do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it "burden_idが空だと登録できない" do
        @product.burden_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Burden can't be blank")
      end

      it "area_idが空だと登録出来ない" do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end

      it "shipping_date_idが空だと登録出来ない" do
        @product.shipping_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end

      it "category_idが空だと登録出来ない" do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it "moneyが空だと登録出来ない" do
        @product.money = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Money can't be blank")
      end

      it "moneyは半角英字のみだと登録できない" do
        @product.money = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Money is not a number")
      end

      it "moneyは半角英数字混合だと登録できないこと" do
        @product.money = 'aaa111'
        @product.valid?
        expect(@product.errors.full_messages).to include("Money is not a number")
      end

      it "moneyは全角数字だと登録できない" do
      @product.money = '１１１'
      @product.valid?
      expect(@product.errors.full_messages).to include("Money is not a number")
      end

      it 'userがいなければ登録できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end

    end


  end
end
