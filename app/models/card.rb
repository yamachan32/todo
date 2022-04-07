class Card < ApplicationRecord

  belongs_to :user
  has_many :tasks
  has_many :comments

  with_options presence: true do
    validates :title
    validates :working_hours
  end 


    
end
