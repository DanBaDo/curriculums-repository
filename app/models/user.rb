class User < ApplicationRecord
    has_many :menberships
    has_many :user_groups, through: :menberships
    has_many :curriculums
end
