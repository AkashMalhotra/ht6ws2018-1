class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.string :name
      t.string :waccount
      t.string :daccount
      t.string :dtype
      t.decimal :value

      t.timestamps
    end
  end
end
