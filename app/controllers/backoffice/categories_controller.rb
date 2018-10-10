class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update, :destroy]
  
  def index
    @contador = Category.all
    @categories = Category.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end
  def new
    @category = Category.new
    options_for_select
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to backoffice_categories_path, notice: "O cadastro (#{@category.name}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_category
  end

  def destroy
    category_name = @category.name

    if @category.posts.blank?
      if @category.destroy
        redirect_to backoffice_categories_path, notice: "O cadastro (#{category_name}) foi excluido com sucesso!"
      else
        render :index
      end
    else
      redirect_to backoffice_posts_path, notice: "A categoria (#{category_name}) possui um ou mais Posts vinculados. Você deve excluir ou editar esses posts antes de excluir a categoria (#{category_name})."
    end

  end

  def update
    #usei o before_action para rodar a função set_category
    if @category.update(params_category)
      redirect_to backoffice_categories_path, notice: "O cadastro (#{@category.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def params_category
      params.require(:category).permit(:name)
    end


end
