# frozen_string_literal: true

FactoryBot.define do
  # TODO: Istantiating Contentful::Asset is not trivial.
  # I'm imitating it using OpenStruct for now:
  factory :asset, class: 'OpenStruct' do
    after(:build) do |asset|
      asset.define_singleton_method(:url) { |**_args| Faker::Internet.url }
    end

    title       { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
  end
end
