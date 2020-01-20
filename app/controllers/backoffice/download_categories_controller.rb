class Backoffice::DownloadCategoriesController < BackofficeController
  before_action :set_download_category, only: [:edit, :update, :destroy]

  def index
    @download_categories = DownloadCategory.order(id: :desc).page(params[:page]).per(15)
    @download_categories_count = DownloadCategory.count

  end

  def new
    @download_category = DownloadCategory.new

  end

  def create
    @download_category = DownloadCategory.new(params_download_category)
    if @download_category.save
      redirect_to backoffice_download_categories_path, notice: "A categoria (#{@download_category.name}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit

  end

  def destroy
    download_category_name = @download_category.name

    if @download_category.downloads.blank?
      if @download_category.destroy
        redirect_to backoffice_download_categories_path, notice: "A categoria (#{download_category_name}) foi excluida com sucesso!"
      else
        render :index
      end
    else
      redirect_to backoffice_download_categories_path, notice: "A categoria (#{download_category_name}) possui um ou mais Downloads vinculados. Você deve excluir esse(s) downloads para poder excluir categoria (#{download_category_name})."
    end

  end

  def update

    if @download_category.update(params_download_category)
      redirect_to backoffice_download_categories_path, notice: "A categoria (#{@download_category.name}) foi atualizada com sucesso!"
    else
      render :index
    end
  end

  private
    def set_download_category
      @download_category = DownloadCategory.find(params[:id])
    end

    def params_download_category
      params.require(:download_category).permit(:name)
    end


end
