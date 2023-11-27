class Comment < ApplicationRecord
  belongs_to :incident
  belongs_to :user

  validates :content, presence: true
end
