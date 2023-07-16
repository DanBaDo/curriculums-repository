class UserGroup < ApplicationRecord
    has_many :menberships
    has_many :users, through: :menberships
end
