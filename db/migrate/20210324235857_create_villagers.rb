class CreateVillagers < ActiveRecord::Migration[6.1]
  def change
      create_table :villagers do |t|
          t.string :name
          t.string :personality
          t.string :species
          t.string :birthday
          t.string :catchphrase
      end
  end
end
