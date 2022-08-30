class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,                null: false
      t.text :product_description,           null: false
      t.integer :category_id,                null: false
      t.integer :status_id,                  null: false
      t.integer :freight_id,                 null: false
      t.integer :shipping_prefecture_id,     null: false
      t.integer :ship_date_id,               null: false
      t.integer :price,                      null: false
      t.references :user,                    null: false, foreign_key: true

      t.timestamps
    end
  end
end
