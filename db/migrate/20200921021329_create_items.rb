class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :detail, null:false
      t.integer :category, null:false, default: 0
      t.integer :quality, null:false, default: 0
      t.integer :delivery_cost, null:false, default: 0
      t.integer :delivery_day, null:false, default: 0
      t.integer :price, null:false
      t.integer :user_id, null:false, foreign_key:true
      t.timestamps
    end
  end
end
