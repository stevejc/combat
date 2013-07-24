class ChangeYellowTypeInSchools < ActiveRecord::Migration
  def up
    change_column :schools, :yellow, :string, default: "unknown"
  end

  def down
    change_column :schools, :yellow, :boolean
  end
end
