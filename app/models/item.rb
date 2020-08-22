class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :shipping_days

  # 空の投稿を保存できないようにする
  validates :category, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :prefectures, presence: true
  validates :shipping_days, presence: true

  # 選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefectures_id
    validates :shipping_days_id
  end
end
