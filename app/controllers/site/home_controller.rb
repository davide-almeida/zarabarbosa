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
