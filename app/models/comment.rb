class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :baseball

  validates :text, presence: true
end
