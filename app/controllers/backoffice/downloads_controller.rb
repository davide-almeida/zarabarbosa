class Backoffice::DownloadsController < BackofficeController
  before_action :set_download, only: [:edit, :update, :destroy]

  def index
    @downloads = Download.order(:order_download).page(params[:page]).per(15)
  end

  def new
    @download = Download.new
    options_for_select

    # @course.build_check_advantage
  end

  def create
    @download = Download.new(params_download)
    if @download.save
      redirect_to backoffice_downloads_path, notice: "O download (#{@download.title}) foi cadastrado com sucesso!"
    else
      render :index
    end
  end

  def edit
    options_for_select
  end

  def destroy
    download_title = @download.title

    if @download.destroy
      redirect_to backoffice_downloads_path, notice: "O download (#{download_title}) foi excluido com sucesso!"
    else
      render :index
    end
    # else
    #   redirect_to backoffice_posts_path, notice: "A categoria (#{category_name}) possui um ou mais Posts vinculados. Você deve excluir ou editar esses posts antes de excluir a categoria (#{category_name})."
    # end
  end

  def update
    #usei o before_action para rodar a função set_category
    if @download.update(params_download)
      redirect_to backoffice_downloads_path, notice: "O download (#{@download.title}) foi atualizado com sucesso!"
    else
      render :index
    end
  end

  private
    def options_for_select
      @download_category_options_for_select = DownloadCategory.all
      @active_options_for_select = ["Ativo", "Inativo"]
    end

    def set_download
      @download = Download.friendly.find(params[:id])
    end

    def params_download
      params.require(:download).permit(:is_active, :order_download, :title, :description, :picture, :lead_frame, :first_button, :download_category_id)
      # lead_frame utilizado para o mailchipm (iframe)
    end

end
