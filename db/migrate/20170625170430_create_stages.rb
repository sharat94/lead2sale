class CreateStages < ActiveRecord::Migration
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :stages do |t|
      t.string :name
      t.text :description
      t.string :color_code
      t.integer :interest_level
      t.hstore :actions

      t.timestamps null: false
    end
  end
end
