class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefectures_id, :city, :block, :building, :phone, :order_id, :token

  UNDER_BAR_EXSIT = /\A[0-9]{3}-[0-9]{4}\z/
  NUMBER_DIFFERENT = /\A\d{10,11}\z/

  with_options presence: true do
    validates :post_code, format: { with: UNDER_BAR_EXSIT, message: 'is invalid. Include hyphen(-)' }
    validates :prefectures_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :block
    validates :phone, format: { with: NUMBER_DIFFERENT, message: 'is invalid. Include 10-11' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(prefectures_id: prefectures_id, post_code: post_code, city: city, block: block, building: building, phone: phone, order_id: order.id)
  end
end
