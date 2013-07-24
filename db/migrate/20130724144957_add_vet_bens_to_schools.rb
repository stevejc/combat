class AddVetBensToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :gi_bill_accredited, :string, default: "unknown"
    add_column :schools, :vet_affairs, :string, default: "unknown"
    add_column :schools, :vet_tuition_waived, :string, default: "unknown"
    add_column :schools, :vet_scholarships, :string, default: "unknown"
    add_column :schools, :sat_waived, :string, default: "unknown"
    add_column :schools, :vet_clubhouse, :string, default: "unknown"
    add_column :schools, :mentor, :string, default: "unknown"
    add_column :schools, :student_vets_america, :string, default: "unknown"
    add_column :schools, :vet_orientation, :string, default: "unknown"
  end
end
