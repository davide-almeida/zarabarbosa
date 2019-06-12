class Site::CoursesController < SiteController
  before_action :set_course, only: [:show]

  def index
    @settings = Setting.first
    @professionals = Professional.order(:id)
    
    @category_courses = CategoryCourse.all
    @courses = Course.all
  end

  def show
    @settings = Setting.first
    @professionals = Professional.order(:id)
    
    #@courses = Course.find(params[:id])
  end

  private
    def set_course
      @courses = Course.friendly.find(params[:id])
    end

end
