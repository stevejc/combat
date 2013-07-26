# == Schema Information
#
# Table name: schools
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  address1             :string(255)
#  address2             :string(255)
#  city                 :string(255)
#  state                :string(255)
#  zip                  :string(255)
#  setting              :string(255)
#  school_type          :string(255)
#  yellow               :string(255)      default("unknown")
#  population           :integer
#  url                  :string(255)
#  remedial             :string(255)
#  counseling           :string(255)
#  employment           :string(255)
#  placement            :string(255)
#  daycare              :string(255)
#  tribal               :string(255)
#  religious            :string(255)
#  historically_black   :string(255)
#  fitness              :string(255)
#  family_housing       :string(255)
#  vet_housing          :string(255)
#  first_year_housing   :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  longitude            :float
#  latitude             :float
#  gi_bill_accredited   :string(255)      default("unknown")
#  vet_affairs          :string(255)      default("unknown")
#  vet_tuition_waived   :string(255)      default("unknown")
#  vet_scholarships     :string(255)      default("unknown")
#  sat_waived           :string(255)      default("unknown")
#  vet_clubhouse        :string(255)      default("unknown")
#  mentor               :string(255)      default("unknown")
#  student_vets_america :string(255)      default("unknown")
#  vet_orientation      :string(255)      default("unknown")
#

class School < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :daycare, :employment, :family_housing, :first_year_housing, :fitness, :historically_black, :name, :placement, :population, :religious, :remedial, :school_type, :setting, :state, :tribal, :url, :vet_housing, :yellow, :zip, :gi_bill_accredited, :vet_affairs, :vet_tuition_waived, :vet_scholarships, :sat_waived, :vet_clubhouse, :mentor, :student_vets_america, :vet_orientation
  
  geocoded_by :address
  after_validation :geocode
  validates :name, :city, :state, presence: true
  
  def address
    output = ""
    output << address1 + ", "
    if address2?
      output << address2 + ", "
    end
    output << city + ", "
    output << state + " "
    output << zip
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      School.create! row.to_hash
    end
  end
  
end
