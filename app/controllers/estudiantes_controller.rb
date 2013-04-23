class EstudiantesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :find_estudiante
  # GET /estudiantes.json
  def index
  if (params[:limit] == nil) or (params[:limit] <= '0') then
    params[:limit] = 2
 end
  @estudiantes= @curso.estudiantes.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
   respond_to do |format|
   format.html # index.html.erb
   format.xml { render :xml => @estudiantes }
    end
  end


  # GET /estudiantes/1
  # GET /estudiantes/1.json
  def show
    @estudiante = Estudiante.find(params[:id])
  end

  # GET /estudiantes/new
  # GET /estudiantes/new.json
  def new
    @estudiante = Estudiante.new
  end

  # GET /estudiantes/1/edit
  def edit
    @estudiante = Estudiante.find(params[:id])
  end

  # POST /estudiantes
  # POST /estudiantes.json
  def create
    @estudiante =@curso.estudiantes.build(params[:estudiante])
      render :action => :new unless @estudiante.save
  end

  # PUT /estudiantes/1
  # PUT /estudiantes/1.json
  def update
    @estudiante = Estudiante.find(params[:id])
    render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
  end

  # DELETE /estudiantes/1
  # DELETE /estudiantes/1.json
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
