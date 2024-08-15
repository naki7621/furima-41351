class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true
  validates :password_confirmation, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :birthday, presence: true

  validate :password_number

  private
  def password_number
    if password.present? && !password.match(/\d/)
      errors.add(:password, 'は少なくとも1つの数字を含める必要があります')
    end
  end
end