class AddUniqueIndexToAnimalsUniqueTag < ActiveRecord::Migration[8.1]
  def change
    add_index :animals, :unique_tag, unique: true
  end
end
