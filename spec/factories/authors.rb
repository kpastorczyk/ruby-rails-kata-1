# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    email { |n| "email#{n}@gmail.com" }
    firstname { |n| "firstname#{n}" }
    lastname { |n| "lasttname#{n}" }
  end
end
