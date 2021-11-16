class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  validates :nickname, presence: true
  validates :birth_date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数の混合で設定してください'

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

end
