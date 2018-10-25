class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  
  def index
    @contador = Admin.all
    @admins = Admin.order(:name).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @admin = Admin.new
    #options_for_select
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "A cadastro (#{@admin.email}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_admin
  end

  def destroy
    admin_email = @admin.email

    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "A cadastro (#{admin_email}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]
    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end


    #usei o before_action para rodar a função set_admin
    if @admin.update(params_admin)
      #AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "O cadastro (#{@admin.email}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      params.require(:admin).permit(:email, :password, :password_confirmation, :name)
    end


end
