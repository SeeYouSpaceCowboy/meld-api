class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name

  has_many :chats, embed: :ids, include: false
end
