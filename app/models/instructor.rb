class Instructor < ActiveRecord::Base
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :materia_id, :nombres, :telefono

def self.search(search)
where('nombres like ?', "%#{search}%")
end

belongs_to :materia
has_many :horarios 
end
