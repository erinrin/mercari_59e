class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  has_many :items, foreign_key: 'buyer_id', foreign_key: 'seller_id'
  belongs_to :address, foreign_key: 'user_id',optional: true
  belongs_to :card, foreign_key: 'user_id',optional: true
  has_many :sns_credentials, dependent: :destroy
  validates :nickname, presence: true
  validates :email, presence: true
  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :name_kana_first, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :name_kana_last, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birthday, presence: true
  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,99999}+\z/i, message: '7文字以上の英数字を入力して下さい。'}
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
