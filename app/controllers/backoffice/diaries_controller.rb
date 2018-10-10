class Backoffice::DiariesController < BackofficeController
  before_action :set_diary, only: [:edit, :update, :destroy]
  
  def index
    @contador = Diary.all
    @diaries = Diary.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @diary = Diary.new
    options_for_select
  end

  def create
    @diary = Diary.new(params_diary)
    if @diary.save
      redirect_to backoffice_diaries_path, notice: "O cadastro (#{@diary.name}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_diary
  end

  def destroy
    diary_name = @diary.name

    if @diary.destroy
      redirect_to backoffice_diaries_path, notice: "O cadastro (#{diary_name}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_diary
    if @diary.update(params_diary)
      redirect_to backoffice_diaries_path, notice: "O cadastro (#{@diary.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_diary
      @diary = Diary.find(params[:id])
    end

    def params_diary
      params.require(:diary).permit(:name, :address, :phone, :week, :start_time, :end_time)
    end


end
