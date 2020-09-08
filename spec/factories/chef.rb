# frozen_string_literal: true

FactoryBot.define do
  # TODO: Istantiating Contentful::Entry is not trivial.
  # I'm imitating it using OpenStruct for now:
  factory :chef, class: 'OpenStruct' do
    name { Faker::Lorem.word }
  end
end
