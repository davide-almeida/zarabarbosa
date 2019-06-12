class Backoffice::PostsController < BackofficeController
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def index
    @contador = Post.all
    @posts = Post.order(id: :desc).page(params[:page]).per(15)

    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end
  end

  def new
    @post = Post.new
    options_for_select
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to backoffice_posts_path, notice: "O cadastro (#{@post.title}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_post
  end

  def destroy
    post_title = @post.title

    if @post.destroy
      redirect_to backoffice_posts_path, notice: "O cadastro (#{post_title}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  def update
    #usei o before_action para rodar a função set_post
    if @post.update(params_post)
      redirect_to backoffice_posts_path, notice: "O cadastro (#{@post.title}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      @category_options_for_select = Category.all
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def params_post
      params.require(:post).permit(:title, :body, :post_date, :admin_id, :category_id, :picture)
    end


end
