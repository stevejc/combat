class AddIpedsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :iped, :string
  end
end
