class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :item
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用しよう' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用しよう' }
  validates :kana_family_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/, message: 'は全角カタカナを使用しよう' }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/, message: 'は全角カタカナを使用しよう' }
  validates :birthday, presence: true

  validate :password_number

  private
  def password_number
    unless password.match(/[a-zA-Z]/) && password.match(/\d/)
      errors.add(:password, 'は少なくとも1つの英字と1つの数字を含める必要があります')
    end
  end
end