class AddressOrder

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  validates :phone_number, length: { maximum: 11 }
  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number
  end

  def save
    order = Order.create(item_id: item_id,user_id: user_id)
    Address.create!(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end