class AddGeoToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :longitude, :float
    add_column :schools, :latitude, :float
  end
end
