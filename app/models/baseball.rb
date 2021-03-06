class Baseball < ApplicationRecord
  acts_as_taggable 
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_one_attached :image

  validates :like_team_id, numericality: { other_than: 1 } 
  validates :title, :content, presence: true
  def self.search(search)
    if search != ""
      Baseball.where('title LIKE(?)', "%#{search}%")
    else
      Baseball.all
    end
  end
end
