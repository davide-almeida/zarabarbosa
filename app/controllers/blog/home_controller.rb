class Blog::HomeController < BlogController
  def index
    @categories = Category.order(:name)
    @posts = Post.order(id: :desc).page(params[:page]).per(5)

    @settings = Setting.first
    @professionals = Professional.order(:id)
  end
end
