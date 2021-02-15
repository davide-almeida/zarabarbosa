class Site::CoursesController < SiteController
  before_action :set_course, only: [:show]
  before_action { :first_time_visit }

  def index
    @settings = Setting.first
    @professionals = Professional.order(:id)
    
    @category_courses = CategoryCourse.all
    @courses = Course.where(is_active: "Ativo").order(:order_course)
  end

  def show
    @settings = Setting.first
    @professionals = Professional.order(:id)
    
    @courses_attributes_count = 0
    @courses.check_advantage.attributes.values.each do |adv|
      if adv == "unchecked"
        @courses_attributes_count += 1
      end
    end

  end

  private
    def set_course
      @courses = Course.friendly.find(params[:id])
    end

end
