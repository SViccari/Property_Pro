class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false 
      t.string :company_name

      t.timestamps
    end

    add_column :buildings, :owner_id, :integer
  end
end
