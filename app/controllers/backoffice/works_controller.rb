class Backoffice::WorksController < BackofficeController
  before_action :set_work, only: [:edit, :update, :destroy]
  
  def index
    @contador = Work.all
    @works = Work.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @work = Work.new
    options_for_select
  end

  def create
    @work = Work.new(params_work)
    if @work.save
      redirect_to backoffice_works_path, notice: "O cadastro (#{@work.company}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_work
  end

  def destroy
    work_company = @work.company

    if @work.destroy
      redirect_to backoffice_works_path, notice: "O cadastro (#{work_company}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_work
    if @work.update(params_work)
      redirect_to backoffice_works_path, notice: "O cadastro (#{@work.company}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_work
      @work = Work.find(params[:id])
    end

    def params_work
      params.require(:work).permit(:company, :role)
    end


end
