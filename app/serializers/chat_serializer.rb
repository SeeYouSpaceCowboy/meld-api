class ChatSerializer < ActiveModel::Serializer
  attributes :id, :users

  has_many :messages

  def users
    object.user_names
  end
end
