class Item < ApplicationRecord
  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :price
    validates :image
    validates :user_id
  end

  belongs_to :user
  ## has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :freight
  belongs_to :shipping_prefecture
  belongs_to :ship_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :freight_id
    validates :shipping_prefecture_id
    validates :ship_date_id
  end

  validates :price, numericality: { only_integer: true }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
