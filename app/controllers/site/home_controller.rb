class Site::HomeController < SiteController
  def index
    @questions = Question.order(:id)
    @projects = Project.order(:id)
    @works = Work.order(:id)
    @flags = Flag.order(:id)
    @services = Service.order(:id)
    @professionals = Professional.order(:id)
    @health_insurances = HealthInsurance.order(:id)
    @posts = Post.last(3).reverse
    @diaries = Diary.order(:id)
    @settings = Setting.first

    @whatsapp = @settings.phone
    @whatsapp = @whatsapp.gsub(/[^0-9]/, '')

    @whatsapp2 = @professionals.first.phone.gsub(/[^0-9]/, '')



    
  end

  def edit
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    respond_to do |format|
      format.js
    end
  end
  
end
