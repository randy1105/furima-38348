class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :category_id
    validates :status_id
    validates :freight_id
    validates :shipping_prefecture_id
    validates :ship_date_id
    validates :price
  end

end
