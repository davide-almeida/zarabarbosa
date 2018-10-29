class Backoffice::ProfessionalsController < BackofficeController
  before_action :set_professional, only: [:edit, :update, :destroy]
  
  def index
    #@contador = Professional.all
    #@professionals = Professional.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    #@professional = Professional.new
    #options_for_select
  end

  def create
    @professional = Professional.new(params_setting)
    if @professional.save
      redirect_to edit_backoffice_professional_path(1), notice: "O cadastro foi realizado com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_professional
  end

  def destroy
    professional_name = @professional.name

    if @professional.destroy
      redirect_to backoffice_path, notice: "O cadastro (#{professional_name}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_professional
    if @professional.update(params_professional)
      redirect_to edit_backoffice_professional_path(1), notice: "O cadastro (#{@professional.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_professional
      @professional = Professional.find(params[:id])
    end

    def params_professional
      params.require(:professional).permit(:name, :title, :number, :description, :phone, :picture)
    end


end
