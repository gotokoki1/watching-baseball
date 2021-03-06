class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :like_team
  has_many :baseballs
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :likes
  has_many :like_baseballs, through: :likes, source: :baseball
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 
  validates :nickname, :like_team_id, presence: true
  validates :like_team_id, numericality: { other_than: 1 } 
end
