# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'O Guia' }
    description { 'das galaxias' }
    image { Faker::Avatar.image }
    author { FactoryBot.create(:author) }
  end
end
