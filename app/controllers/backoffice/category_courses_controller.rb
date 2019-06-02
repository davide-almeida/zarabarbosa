class Backoffice::CategoryCoursesController < BackofficeController
  before_action :set_category_course, only: [:edit, :update, :destroy]
  def index
    @category_courses = CategoryCourse.order(id: :desc).page(params[:page]).per(15)
  end

  def new
    @category_course = CategoryCourse.new
    # options_for_select
  end

  def create
    @category_course = CategoryCourse.new(params_category_course)
    if @category_course.save
      redirect_to backoffice_category_courses_path, notice: "A categoria (#{@category_course.name}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
    # options_for_select
  end

  def destroy
    category_course_name = @category_course.name
    if @category_course.courses.blank?
      if @category_course.destroy
        redirect_to backoffice_category_courses_path, notice: "A categoria (#{category_course_name}) foi excluida com sucesso!"
      else
        render :index
      end
    else
      redirect_to backoffice_category_courses_path, notice: "A categoria (#{category_course_name}) possui um ou mais Posts vinculados. Você deve excluir ou editar esses posts antes de excluir a categoria (#{category_name})."
    end
  end

  def update
    #usei o before_action para rodar a função set_category
    if @category_course.update(params_category_course)
      redirect_to backoffice_category_courses_path, notice: "A categoria (#{@category_course.name}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      #@branch_options_for_select = Branch.all
    end

    def set_category_course
      @category_course = CategoryCourse.find(params[:id])
    end

    def params_category_course
      params.require(:category_course).permit(:name)
    end

end
