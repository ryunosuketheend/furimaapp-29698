class AddHouseNumberToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :house_number, :string, null:false
  end
end
