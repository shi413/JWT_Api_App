class CreateCleaningservices < ActiveRecord::Migration[7.1]
  def change
    create_table :cleaningservices do |t|
      t.string :name
      t.integer :price
      t.integer :mobileno
      t.string :status

      t.timestamps
    end
  end
end
