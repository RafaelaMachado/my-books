class Author < ApplicationRecord
  has_many :books

  extend FriendlyId
  friendly_id :name, use: :slugged
end
