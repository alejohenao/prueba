class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.date :dia
      t.time :hora
      t.string :aula
      t.references :materia_id
      t.references :instructor_id
      t.references :curso_id

      t.timestamps
    end
    add_index :horarios, :materia_id_id
    add_index :horarios, :instructor_id_id
    add_index :horarios, :curso_id_id
  end
end
