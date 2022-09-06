class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :block, :building_name, :phone_number, :order_id, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :post_code
    validates :municipalities
    validates :block
    validates :phone_number, format: { with: /\A^\d{10,11}$\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めて入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, block: block,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
