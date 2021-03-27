class User < ActiveRecord::Base
    has_secure_password 
    has_many :villagers

    validates :name, presence: true
    validates :password_digest, presence: true
    validates :email, uniqueness: true
end