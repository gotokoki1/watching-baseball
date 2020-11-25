class Baseball < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :like_team_id, numericality: { other_than: 1 } 
  validates :title, :content, presence: true
end
