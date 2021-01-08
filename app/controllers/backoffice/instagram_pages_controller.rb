class Backoffice::InstagramPagesController < BackofficeController
  before_action :set_instagram_page, only: [:edit, :update]

  def index
    # @instagram_page = InstagramPages.first
  end

  def new
    @instagram_page = InstagramPage.new
  end

  def create
    @instagram_page = InstagramPage.new(params_instagram_page)

    if @instagram_page.save
      redirect_to edit_backoffice_instagram_page_path(1), notice: "O cadastro (#{@instagram_page.title}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update  
    if @instagram_page.update(params_instagram_page)
      redirect_to edit_backoffice_instagram_page_path(1), notice: "O cadastro (#{@instagram_page.title}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def set_instagram_page
      @instagram_page = InstagramPage.find(params[:id])
    end

    def params_instagram_page
      params.require(:instagram_page).permit(
        :title, :footer,
        instagram_links_attributes:[:title, :description, :link, :_destroy, :id]
      )
    end

end
