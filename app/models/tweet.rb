class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :replied_to, optional: true

  has_many :likes
end
