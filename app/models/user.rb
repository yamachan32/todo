class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # has_many :teams
    has_many :teams, through: :team_users
    has_many :cards
    has_many :comments
    has_many :team_users
  
    validates :name, presence: true
    validates :section, presence: true
   
  
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'は文字と数字の両方を含めてください'
end
