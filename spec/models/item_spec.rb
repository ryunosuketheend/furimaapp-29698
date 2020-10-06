require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "商品が出品できる場合" do
      it "name, detail, category, quality, delivery_cost, delivery_day, price, user_id, region_id, imageがあれば商品が出品される" do
        expect(@item).to be_valid
      end
      it "priceが300以上であれば商品が出品される" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "priceが10000000未満であれば商品が出品される" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
      it "nameが40文字以下であれば商品が出品される" do
        @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        expect(@user).to be_valid
      end
    end
    context "商品が出品できない場合" do
      it "nameがないと出品することができない" do
        @item.name= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "detailがないと出品することができない" do
        @item.detail= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Detail can't be blank")
      end
      it "categoryがないと出品することができない" do
        @item.category= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Category can't be blank")
      end
      it "qualityがないと出品することができない" do
        @item.quality= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Quality can't be blank")
      end
      it "delivery_costがないと出品することができない" do
        @item.delivery_cost= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Delivery_Cost can't be blank")
      end
      it "delivery_dayがないと出品することができない" do
        @item.delivery_day= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Delivery_Day can't be blank")
      end
      it "priceがないと出品することができない" do
        @item.price= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Price can't be blank")
      end
      it "imageがないと出品することができない" do
        @item.image= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end
      it "region_idがないと出品することができない" do
        @item.region_id= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Region_Id can't be blank")
      end
      it "user_idがないと出品することができない" do
        @item.user_id= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User_Id can't be blank")
      end    
      it "nameが40文字以上だと出品することができない" do
        @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        expect(@user.errors.full_messages).to include("User_Id can't be blank")
      end     
      it "priceが300未満だと出品することができない" do
        @item.price = 299
        expect(@user.errors.full_messages).to include("User_Id can't be blank")
      end
      it "priceが10000000以上だと出品することができない" do
        @item.price = 10000001
        expect(@user.errors.full_messages).to include("User_Id can't be blank")
      end
    end
  end
end