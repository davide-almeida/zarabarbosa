class Backoffice::ServicesController < BackofficeController
  before_action :set_service, only: [:edit, :update, :destroy]
  
  def index
    @contador = Service.all
    @services = Service.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @service = Service.new
    options_for_select
  end

  def create
    @service = Service.new(params_service)
    if @service.save
      redirect_to backoffice_services_path, notice: "O cadastro (#{@service.title}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_service
  end

  def destroy
    service_title = @service.title

    if @service.destroy
      redirect_to backoffice_services_path, notice: "O cadastro (#{service_title}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_service
    if @service.update(params_service)
      redirect_to backoffice_services_path, notice: "O cadastro (#{@service.title}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_service
      @service = Service.find(params[:id])
    end

    def params_service
      params.require(:service).permit(:title, :description, :picture)
    end


end
