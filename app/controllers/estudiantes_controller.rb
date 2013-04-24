class EstudiantesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :find_estudiante
  
  def index
  if (params[:limit] == nil) or (params[:limit] <= '0') then
    params[:limit] = 2
 end
  @estudiantes= @curso.estudiantes.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
   respond_to do |format|
   format.html 
   format.xml { render :xml => @estudiantes }
    end
  end



  def show
    @estudiante = Estudiante.find(params[:id])
  end


  def new
    @estudiante = Estudiante.new
  end


  def edit
    @estudiante = Estudiante.find(params[:id])
  end


  def create
    @estudiante =@curso.estudiantes.build(params[:estudiante])
      render :action => :new unless @estudiante.save
  end


  def update
    @estudiante = Estudiante.find(params[:id])
    render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
  end


  def destroy
    @estudiante = Estudiante.find(params[:id])
    @estudiante.destroy
  end

  private
  def find_estudiante
   @curso=Curso.find (params[:curso_id])
   @estudiante = Estudiante.find(params[:id]) if params[:id]
  end

  private
  
  def sort_column
    Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "id"

  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
