class Message < ApplicationRecord
    belongs_to :sender_user, class_name: 'User', foreign_key: :sender_user_id
    belongs_to :group

    attr_accessor :user

    validates :content, presence: true
end
