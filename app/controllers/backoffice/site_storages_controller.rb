class Backoffice::SiteStoragesController < BackofficeController
  before_action :set_site_storage, only: [:edit, :update, :destroy]

  def index
    @site_storages_count = SiteStorage.count
    @site_storages = SiteStorage.order(:name).page(params[:page]).per(15)
  end

  def new
    @site_storage = SiteStorage.new
    #options_for_select
  end

  def create
    @site_storage = SiteStorage.new(params_site_storage)
    if @site_storage.save
      redirect_to backoffice_site_storages_path, notice: "A arquivo (#{@site_storage.name}) foi cadastrado com sucesso!"
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @site_storage.update(params_site_storage)
      redirect_to backoffice_site_storages_path, notice: "O cadastro (#{@site_storage.name}) foi atualizado com sucesso!"
    else
      render :index
    end
  end

  def destroy
    site_storage_name = @site_storage.name

    if @site_storage.destroy
      redirect_to backoffice_site_storages_path, notice: "O arquivo (#{site_storage_name}) foi excluido com sucesso!"
    else
      render :index
    end

  end

  private
    def set_site_storage
      @site_storage = SiteStorage.find(params[:id])
    end

    def params_site_storage
      params.require(:site_storage).permit(:name, :description, :annex)
    end

end
