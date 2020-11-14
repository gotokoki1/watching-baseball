class Baseball < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, :content, :like_team_id, presence: true
end
