class HorarioPdf < Prawn::Document
       def initialize(horario, view)
 super()
 @horario = horario
 logo
 @view = view
 text "Horario Nro: #{@horario.id}"
 text "Dia: #{@horario.dia}"
 text "Hora: #{@horario.hora}"
 text "Aula: #{@horario.aula}"
 text "Materia: #{@horario.materia.nombres}"
 text "Instructor: #{@horario.instructor.nombres}"
 text "Curso: #{@horario.curso.nombre}"
end


def logo
 logopath =  "#{Rails.root}/app/assets/images/charlot.png"
end

end