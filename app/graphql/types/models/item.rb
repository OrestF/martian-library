class Types::Models::Item < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: true
  field :description, String, null: true
  field :image_url, String, null: true
  # field :user_id, Integer, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

  field :user, Types::Models::User, null: false
end

