module Mutations
  class AddItemMutation < Mutations::BaseMutation
    argument :attributes, Types::ItemAttributes, required: true # new argument

    field :item, Types::ItemType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(attributes:)
      check_authentication!

      item = Item.new(attributes.to_h.merge(user: context[:current_user]))

      if item.save
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
