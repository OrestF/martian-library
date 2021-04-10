module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    # input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError, 'You need to authenticate to perform this action'
    end
  end
end
# query Users {
#   users {
#     id
#     fullName
#     items {
#       id
#       title
#       description
#     }
#   }
# }
# query Me {
#   me {
#     id
#     fullName
#   }
# }
#
# mutation SignMeIn($email: String!) {
#   signIn(email: $email) {
#     token
#     user {
#       id
#       fullName
#     }
#   }
# }
#
# query LibraryQuery {
#   items {
#     id
#     title
#     imageUrl
#     description
#     user {
#       id
#       email
#     }
#   }
# }
#
# mutation AddItemMutation(
#   $title: String!
#   $description: String
#   $imageUrl: String
# ) {
#   addItem(title: $title, description: $description, imageUrl: $imageUrl) {
#     item {
#       id
#       title
#       description
#       imageUrl
#       user {
#         id
#         email
#       }
#     }
#   }
# }
#
# mutation UpdateItemMutation(
#   $id: ID!
#   $title: String!
#   $description: String
#   $imageUrl: String
# ) {
#   updateItem(
#     id: $id
#     title: $title
#     description: $description
#     imageUrl: $imageUrl
#   ) {
#     item {
#       id
#       title
#       description
#       imageUrl
#     }
#   }
# }