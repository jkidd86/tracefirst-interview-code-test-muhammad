class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :unique_tag
      t.string :species
      t.string :breed
      t.timestamps
    end
  end
end
