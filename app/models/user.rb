class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  USER_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  USER_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :birth
    validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
  end

  validates :nickname, length: { maximum: 40 }

  with_options presence: true, format: { with: USER_NAME_REGEX, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: USER_NAME_KANA_REGEX, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  has_many :items
  has_many :orders
end
