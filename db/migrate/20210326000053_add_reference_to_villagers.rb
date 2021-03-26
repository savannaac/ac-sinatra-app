class AddReferenceToVillagers < ActiveRecord::Migration[6.1]
    def change
        add_reference :villagers, :user, foreign_key: true
    end
end
