# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'MyString' }
    description { 'MyString' }
    image { 'MyString' }
    author { nil }
  end
end
