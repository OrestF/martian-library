module Mutations
  class UpdateItemMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :attributes, ::Types::Attributes::ItemAttr, required: true

    field :item, ::Types::Models::Item, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:, attributes:)
      check_authentication!

      item = Item.find(id)
      if item.update(attributes.to_h)
        MartianLibrarySchema.subscriptions.trigger('itemUpdated', {}, item)
        { item: item }
      else
        { errors: item.errors }
      end
    end
  end
end
