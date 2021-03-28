class AddStatusToVillagers < ActiveRecord::Migration[6.1]
    def change
        add_column :villagers, :status, :string
    end
end
