class Blog::CategoriesController < BlogController

  #before_action :set_post, only: [:show]

  def index
    @posts = Post.friendly.where(category_id: Category.ids).page(params[:page]).per(15)

    @settings = Setting.first
    @professionals = Professional.order(:id)
  end

  def show
    @categories_menu = Category.friendly.order(:name)
    @categoriess = Category.friendly.find(params[:id])
    @posts = @categoriess.posts.where(:category_id => @categoriess.id).order(id: :desc)
    #@dado = Rescuepoint.where(:client_id => current_client.id)
    @settings = Setting.first
    @professionals = Professional.order(:id)
  end
end
