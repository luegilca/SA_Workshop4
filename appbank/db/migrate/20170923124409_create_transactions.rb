class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :startAcount
      t.references :finalAcount
      t.integer :iduser
      t.float :amount

      t.timestamps
    end
  end
end
