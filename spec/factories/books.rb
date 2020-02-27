# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { |n| "title#{n}" }
    isbn { |n| "isbn#{n}" }
    description { |n| "description#{n}" }
    authors { |n| "author#{n}@gmail.com" }
  end
end
