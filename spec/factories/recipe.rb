# frozen_string_literal: true

FactoryBot.define do
  # TODO: Istantiating something that subclasses ContentfulModel::Base is not trivial.
  # I'm imitating it using OpenStruct for now:
  factory :recipe, class: 'OpenStruct' do
    title { Faker::Lorem.sentence }
  end
end
