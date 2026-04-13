class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :result
      t.references :animal, foreign_key: true
      t.references :veterinarian, foreign_key: true
      t.timestamps
    end
  end
end
