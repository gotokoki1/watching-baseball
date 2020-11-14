class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :like_team
  has_many :baseballs
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :like_team_id, presence: true
  validates :like_team_id, numericality: { other_than: 1 } 
end
