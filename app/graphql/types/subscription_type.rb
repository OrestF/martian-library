module Types
  class SubscriptionType < GraphQL::Schema::Object
    field :item_added, ::Types::Models::Item, null: false, description: "An item was added"
    field :item_updated, ::Types::Models::Item, null: false, description: "Existing item was updated"

    def item_added; end
    def item_updated; end
  end
end