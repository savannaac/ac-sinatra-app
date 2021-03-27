class Villager < ActiveRecord::Base
    belongs_to :user

    validates :catchphrase, uniqueness: true
end