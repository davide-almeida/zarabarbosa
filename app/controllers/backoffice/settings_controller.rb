class Backoffice::SettingsController < BackofficeController
  before_action :set_setting, only: [:edit, :update, :destroy]
  
  def index
    @contador = Setting.all
    @settings = Setting.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @setting = Setting.new
    options_for_select
  end

  def create
    @setting = Setting.new(params_setting)
    if @setting.save
      redirect_to edit_backoffice_setting_path(1), notice: "O cadastro foi realizado com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_setting
  end

  def destroy
    if @setting.destroy
      redirect_to backoffice_home_path, notice: "O cadastro foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_setting
    if @setting.update(params_setting)
      redirect_to edit_backoffice_setting_path(1), notice: "O cadastro foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      @cookie_active_options_for_select = ["Ativo", "Inativo"]
    end

    def set_setting
      @setting = Setting.find(params[:id])
    end

    def params_setting
      params.require(:setting).permit(
        :email, :phone, :header, :facebook, :instagram, :twitter, :linkedin, :youtube, :picture, :picture_footer, :privacy_policy, :terms_use, :cookie_active
      )
    end


end
