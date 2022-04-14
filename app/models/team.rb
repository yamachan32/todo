class Team < ApplicationRecord
  # belongs_to :user
  has_many :users, through: :team_users
  has_many :team_users
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :team_name
    validates :team_explanation
  end
end
