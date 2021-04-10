module Mutations
  class AddItemMutation < Mutations::BaseMutation
    argument :attributes, ::Types::Attributes::ItemAttr, required: true # new argument

    field :item, ::Types::Models::Item, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(attributes:)
      check_authentication!

      item = Item.new(attributes.to_h.merge(user: context[:current_user]))

      if item.save
        MartianLibrarySchema.subscriptions.trigger('itemAdded', {}, item)
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
