class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item, null: false
      t.text :info, null: false
      t.integer :category_id, null: false
      t.integer :rank_id, null: false
      t.integer :postage_id, null: false
      t.integer :area_id, null: false
      t.integer :scheduled_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
