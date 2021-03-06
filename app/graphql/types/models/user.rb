class Types::Models::User < Types::BaseObject
  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :full_name, String, null: true
  field :items, [Types::Models::Item], null: true
  field :email, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

  def full_name
    # `object` references the user instance
    [object.first_name, object.last_name].compact.join(' ')
  end
end

