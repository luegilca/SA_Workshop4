class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :firstname
      t.string :lastname
      t.float :balance
      t.integer :iduser

      t.timestamps
    end
  end
end
