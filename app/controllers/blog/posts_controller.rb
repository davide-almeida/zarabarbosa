class Blog::PostsController < BlogController
  def index
    @categories = Category.friendly.order(:name)
    @posts = Post.friendly.order(id: :desc).page(params[:page]).per(5)

    @settings = Setting.first
    @professionals = Professional.order(:id)
  end

  def show
    @categories = Category.friendly.order(:name)
    @post = Post.friendly.find(params[:id])

    @settings = Setting.first
    @professionals = Professional.order(:id)
  end
end
