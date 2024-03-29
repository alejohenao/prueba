class Estudiante < ActiveRecord::Base
  attr_accessible :curso_id, :cedula, :direccion, :email, :fch_nacimiento, :nombres, :curso_id

 def self.search(search)
where('nombres like ?', "%#{search}%")
end

validates :nombres, :presence => true,
:length => { :maximum => 80 }
 
validates :email, :presence => true,
:uniqueness => true,
:format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

validates :cedula, :presence => true,
:length => { :minimum => 6, :maximum => 15 },
:numericality => true

belongs_to :curso

end
