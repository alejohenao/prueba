class CursosController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /cursos
  # GET /cursos.json
  def index

    if (params[:limit] == nil) or (params[:limit] <= '0') then
    params[:limit] = 10
   end  
    @cursos = Curso.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
    respond_to do |format|
    format.html # index.html.erb
    format.xml { render :xml => @cursos }
    end
 end


  def show
      @curso = Curso.find(params[:id])
  end

  def new
      @curso = Curso.new
  end

  def edit
      @curso= Curso.find(params[:id])
  end

  def create
      @curso= Curso.new(params[:curso])
      render :action => :new unless @curso.save
  end

  def update
      @curso = Curso.find(params[:id])
      render :action => :edit unless @curso.update_attributes(params[:curso])
  end

  def destroy
      @curso = Curso.find(params[:id])
      @curso.destroy
  end

private

def sort_column
    Curso.column_names.include?(params[:sort]) ? params[:sort] : "id"

  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

