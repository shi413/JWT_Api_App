class CreateMoppingservices < ActiveRecord::Migration[7.1]
  def change
    create_table :moppingservices do |t|
      t.string :name
      t.integer :price
      t.integer :mobileno
      t.string :status

      t.timestamps
    end
  end
end
