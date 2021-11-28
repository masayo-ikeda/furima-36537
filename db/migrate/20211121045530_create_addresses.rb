class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :code, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :number, null: false
      t.string :building
      t.string :tel, null: false
      t.timestamps
    end
  end
end
## addresses table

# | Column      | Type       | Options                        |
# |-------------|------------|--------------------------------|
# | order       | references | null: false, foreign_key: true |
# | code        | string     | null: false                    |
# | area_id     | integer    | null: false                    |
# | city        | string     | null: false                    |
# | number      | string     | null: false                    |
# | building    | string     |                                |
# | tel         | string     | null: false                    |

### Association

# * belongs_to :order