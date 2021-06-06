# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
