class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
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
