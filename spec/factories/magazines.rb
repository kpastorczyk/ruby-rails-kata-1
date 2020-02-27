# frozen_string_literal: true

FactoryBot.define do
  factory :magazine do
    title { |n| "title#{n}" }
    isbn { |n| "isbn#{n}" }
    authors { |n| "author#{n}@gmail.com" }
  end
end
