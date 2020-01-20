class Backoffice::FlagsController < BackofficeController
  before_action :set_flag, only: [:edit, :update, :destroy]
  
  def index
    @contador = Flag.all
    @flags = Flag.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @flag = Flag.new
    options_for_select
  end

  def create
    @flag = Flag.new(params_flag)
    if @flag.save
      redirect_to backoffice_flags_path, notice: "O cadastro (#{@flag.title}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_flag
  end

  def destroy
    flag_title = @flag.title

    if @flag.destroy
      redirect_to backoffice_flags_path, notice: "O cadastro (#{flag_title}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_flag
    if @flag.update(params_flag)
      redirect_to backoffice_flags_path, notice: "O cadastro (#{@flag.title}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      @target_link_options_for_select = ["Nova aba", "Mesma aba"]
    end

    def set_flag
      @flag = Flag.find(params[:id])
    end

    def params_flag
      params.require(:flag).permit(:title, :description, :picture, :link_flag, :target_link, :link_name)
    end


end
