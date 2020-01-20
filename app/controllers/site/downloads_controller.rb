class Site::DownloadsController < SiteController
  before_action :set_download, only: [:show]

  def index
    @settings = Setting.first
    @professionals = Professional.order(:id)

    @download_categories = DownloadCategory.all
    @downloads = Download.where(is_active: "Ativo").order(:order_download)
  end

  def show
    @settings = Setting.first
    @professionals = Professional.order(:id)

    @download_categories = DownloadCategory.order(:name)
    @download = Download.friendly.find(params[:id])

  end

  private
    def set_download
      @downloads = Download.friendly.find(params[:id])
    end

end
