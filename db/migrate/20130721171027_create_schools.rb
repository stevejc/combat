class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :setting
      t.string :school_type
      t.boolean :yellow
      t.integer :population
      t.string :url
      t.string :remedial
      t.string :counseling
      t.string :employment
      t.string :placement
      t.string :daycare
      t.string :tribal
      t.string :religious
      t.string :historically_black
      t.string :fitness
      t.string :family_housing
      t.string :vet_housing
      t.string :first_year_housing

      t.timestamps
    end
  end
end
