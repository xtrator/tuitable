class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :replied_to,
             optional: true,
             class_name: 'Tweet',
             counter_cache: :replies_count

  has_many :replies,
           class_name: 'Tweet',
           foreign_key: :replied_to_id,
           dependent: :destroy,
           inverse_of: :replied_to

  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 140 }
end
