class Backoffice::QuestionsController < BackofficeController
  before_action :set_question, only: [:edit, :update, :destroy]
  
  def index
    @contador = Question.all
    @questions = Question.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @question = Question.new
    #options_for_select
  end

  def create
    @question = Question.new(params_question)
    if @question.save
      redirect_to backoffice_questions_path, notice: "O cadastro (#{@question.doubt}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_question
  end

  def destroy
    question_doubt = @question.doubt

    if @question.destroy
      redirect_to backoffice_questions_path, notice: "O cadastro (#{question_doubt}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_question
    if @question.update(params_question)
      redirect_to backoffice_questions_path, notice: "O cadastro (#{@question.doubt}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def params_question
      params.require(:question).permit(:doubt, :answer)
    end


end
