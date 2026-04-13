class CreateVeterinarians < ActiveRecord::Migration[6.1]
  def change
    create_table :veterinarians do |t|
      t.string :name
      t.string :status
      t.boolean :admin, default: false
      t.string :number

      t.timestamps
    end
  end
end
