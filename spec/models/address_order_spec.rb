require 'rails_helper'
describe AddressOrder do
  before do
    @buyer = FactoryBot.create(:user)
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @seller.id)
    @address_order = FactoryBot.build(:address_order, user_id: @buyer.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "postal_code, region_id, city, house_number, phone_number, tokenが存在すれば登録できる" do
        sleep(1)
        expect(@address_order).to be_valid
      end
      it "phone_numberが11桁以下であれば商品が購入できる" do
        @address_order.phone_number = "aaaaaaaaaa"
        expect(@address_order).to be_valid
      end
      it "postal_codeにハイフンが含まれてたら商品が購入できる" do
        @address_order.postal_code = "123-4567"
        expect(@address_order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空だと購入できない" do
        @address_order.token = ''
        @address_order.valid?
        sleep(1)
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと購入できない" do
        @address_order.postal_code = ''
        @address_order.valid?
        sleep(1)
        expect(@address_order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it "region_idが空だと購入できない" do
        @address_order.region_id = ''
        @address_order.valid?
        sleep(1)
        expect(@address_order.errors[:region_id]).to include("can't be blank")
      end
      it "cityが空だと購入できない" do
        @address_order.city = ''
        @address_order.valid?
        sleep(1)
        expect(@address_order.errors[:city]).to include("can't be blank")
      end
      it "house_numberが空だと購入できない" do
        @address_order.house_number = ''
        @address_order.valid?
        sleep(1)
        expect(@address_order.errors[:house_number]).to include("can't be blank")
      end
      it "phone_numberが空だと購入できない" do
        @address_order.phone_number = ''
        @address_order.valid?
        sleep(1)
        expect(@address_order.errors[:phone_number]).to include("can't be blank")
      end
      it "phone_numberが11桁以上だと購入することができない" do
        @address_order.phone_number = "aaaaaaaaaaaa"
        expect(@address_order.errors.full_messages).to include()
      end
      it "postal_codeにハイフンが含まれていないと購入することができない" do
        @address_order.postal_code =("1234567")
        @address_order.valid?
        expect(@address_order.errors[:postal_code]).to include("is invalid. Include hyphen(-)")
      end
    end
  end
end