class Backoffice::HealthInsurancesController < BackofficeController
  before_action :set_health_insurance, only: [:edit, :update, :destroy]
  
  def index
    @contador = HealthInsurance.all
    @health_insurances = HealthInsurance.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @health_insurance = HealthInsurance.new
    options_for_select
  end

  def create
    @health_insurance = HealthInsurance.new(params_health_insurance)
    if @health_insurance.save
      redirect_to backoffice_health_insurances_path, notice: "O cadastro (#{@health_insurance.name}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_health_insurance
  end

  def destroy
    health_insurance_name = @health_insurance.name

    if @health_insurance.destroy
      redirect_to backoffice_health_insurances_path, notice: "O cadastro (#{health_insurance_name}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_health_insurance
    if @health_insurance.update(params_health_insurance)
      redirect_to backoffice_health_insurances_path, notice: "O cadastro (#{@health_insurance.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_health_insurance
      @health_insurance = HealthInsurance.find(params[:id])
    end

    def params_health_insurance
      params.require(:health_insurance).permit(:name, :picture)
    end
end
