class AddColumnToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :interest_level, :integer
  end
end
