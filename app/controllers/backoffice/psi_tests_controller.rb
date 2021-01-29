class Backoffice::PsiTestsController < BackofficeController
  before_action :set_psi_test, only: [:edit, :update, :destroy]

  def index
    @psi_tests_count = PsiTest.count
    @psi_tests = PsiTest.order(:title).page(params[:page]).per(15)
  end

  def new
    @psi_test = PsiTest.new
    # @psi_test.test_results.build

    options_for_select
  end

  def create
    @psi_test = PsiTest.new(params_psi_test)

    if @psi_test.save
      redirect_to backoffice_psi_tests_path, notice: "O teste #{@psi_test.title} foi cadastrado com sucesso!"
    else
      render :index
    end
  end
  

  def edit
    options_for_select
  end

  def update
    if @psi_test.update(params_psi_test)
      redirect_to backoffice_psi_tests_path, notice: "O teste #{@psi_test.title} foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    psi_test_title = @psi_test.title
    if @psi_test.destroy
      redirect_to backoffice_psi_tests_path, notice: "O test #{psi_test_title} foi excluído com sucesso!"
    else
      render :index
    end
  end

  private
  def options_for_select
    @active_options_for_select = ["Ativo", "Inativo"]
    @condition_options_for_select = [
      ["Se o resultado for menor que", "<"], ["Se o resultado for maior que", ">"], ["Se o resultado for igual a", "="]
    ]
  end
  
    def set_psi_test
      @psi_test = PsiTest.friendly.find(params[:id])
    end
    
    def params_psi_test
      params.require(:psi_test).permit(
        :is_active, :title, :picture, :description,
        test_questions_attributes:[
          :title, :_destroy, :id, 
          test_alternatives_attributes:[:title, :rank_point, :_destroy, :id]
        ],
        test_results_attributes:[:condition, :rank_point_limit, :description, :_destroy, :id]
      )
    end
    
  
end
