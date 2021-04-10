module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :items,
          [Types::Models::Item],
          null: false,
          description: 'Returns a list of items in the martian library'

    field :users,
          [Types::Models::User],
          null: false,
          description: 'Returns a list of users in the martian library'

    field :me, Types::Models::User, null: true

    def me
      context[:current_user]
    end

    def items
      Item.all.lazy_preload(:user)
    end

    def users
      User.all.lazy_preload(:items)
    end
  end
end
