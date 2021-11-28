class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
## orders table

# | Column      | Type       | Options                        |
# |-------------|------------|--------------------------------|
# | user        | references | null: false, foreign_key: true |
# | item        | references | null: false, foreign_key: true |

# ### Association

# - belongs_to :user
# - has_one :address
# - belongs_to :item