class Materia < ActiveRecord::Base
  attr_accessible :nombres

  def self.search(search)
  where('nombres like ?', "%#{search}%")
  end

  has_many :instructores
  has_many :horarios

end
