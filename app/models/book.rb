class Book < ApplicationRecord
  belongs_to :author

  extend FriendlyId
  friendly_id :title, use: :slugged
end
