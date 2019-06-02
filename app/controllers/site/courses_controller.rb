class Site::CoursesController < SiteController
  def index
    @settings = Setting.first
    @professionals = Professional.order(:id)
    
    @category_courses = CategoryCourse.all
    @courses = Course.all
  end

  def show
    @settings = Setting.first
    @professionals = Professional.order(:id)
    
    #@category_courses = CategoryCourse.find(params[:id])
    @courses = Course.find(params[:id])
    #@advantages = CheckAdvantage.where(:course_id => @courses.id)
  end
end
