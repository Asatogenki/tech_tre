class User < ApplicationRecord
    validates :name, {presence:true}
    validates :user, {presence:true, uniqueness:true}
end
