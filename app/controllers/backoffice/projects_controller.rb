class Backoffice::ProjectsController < BackofficeController
  before_action :set_project, only: [:edit, :update, :destroy]
  
  def index
    @contador = Project.all
    @projects = Project.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @project = Project.new
    options_for_select
  end

  def create
    @project = Project.new(params_project)
    if @project.save
      redirect_to backoffice_projects_path, notice: "O cadastro (#{@project.description}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_project
  end

  def destroy
    project_description = @project.description

    if @project.destroy
      redirect_to backoffice_projects_path, notice: "O cadastro (#{project_description}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_project
    if @project.update(params_project)
      redirect_to backoffice_projects_path, notice: "O cadastro (#{@project.description}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def params_project
      params.require(:project).permit(:description)
    end


end
