class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, foreign_key: 'buyer_id', foreign_key: 'seller_id'
  belongs_to :address, foreign_key: 'user_id'
  belongs_to :card, foreign_key: 'user_id'
  has_many :sns_credentials, dependent: :destroy
  # validates :name_kana, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :nickname, presence: true
  validates :email, presence: true
  validates :name_kana, presence: true
  validates :name, presence: true
  validates :birthday, presence: true
end
