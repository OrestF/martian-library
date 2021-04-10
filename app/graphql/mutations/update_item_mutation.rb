module Mutations
  class UpdateItemMutation < Mutations::BaseMutation
    argument :attributes, Types::ItemAttributes, required: true

    field :item, Types::ItemType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(attributes:)
      check_authentication!

      item = Item.find(id)
      if item.update(attributes.to_h.merge(user: context[:current_user]))
        { item: item }
      else
        { errors: item.errors }
      end
    end
  end
end
