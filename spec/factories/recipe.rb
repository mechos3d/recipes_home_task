# frozen_string_literal: true

FactoryBot.define do
  # TODO: Istantiating something that subclasses ContentfulModel::Base is not trivial.
  # I'm imitating it using OpenStruct for now:
  factory :recipe, class: 'OpenStruct' do
    id          { SecureRandom.uuid }
    title       { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    calories    { 42 }
    photo       { build(:asset) }
    tags        { build_list(:tag, 1) }
    chef        { build(:chef) }
  end
end
