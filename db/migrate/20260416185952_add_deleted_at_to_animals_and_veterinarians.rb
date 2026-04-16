class AddDeletedAtToAnimalsAndVeterinarians < ActiveRecord::Migration[8.1]
  def change
    add_column :animals, :deleted_at, :datetime
    add_column :veterinarians, :deleted_at, :datetime
    add_index :animals, :deleted_at
    add_index :veterinarians, :deleted_at
  end
end
