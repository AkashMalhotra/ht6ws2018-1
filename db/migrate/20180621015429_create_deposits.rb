class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.string :waccount
      t.string :daccount
      t.string :type
      t.decimal :amount

      t.timestamps
    end
  end
end
