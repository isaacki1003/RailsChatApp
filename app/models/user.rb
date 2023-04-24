class User < ApplicationRecord
    has_and_belongs_to_many :groups
    has_many :messages, foreign_key: :sender_user_id
end
