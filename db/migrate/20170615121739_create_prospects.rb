class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :full_name
      t.string :email
      t.float :phone
      t.string :location
      t.integer :stage_id
      t.integer :managed_by

      t.timestamps null: false
    end
  end
end
