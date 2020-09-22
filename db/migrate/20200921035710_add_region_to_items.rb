class AddRegionToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :region_id, :integer, null:false
  end
end
