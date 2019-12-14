class Backoffice::CoursesController < BackofficeController
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.order(id: :desc).page(params[:page]).per(15)
  end

  def new
    @course = Course.new
    #@check_advantages = @courses.check_advantage
    options_for_select

    @course.build_check_advantage
  end

  def create
    @course = Course.new(params_course)
    if @course.save
      redirect_to backoffice_courses_path, notice: "O curso (#{@course.title}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
    options_for_select
    #usei o before_action para rodar a função set_category
  end

  def destroy
    course_title = @course.title

    # if @course.posts.blank?
    if @course.destroy
      redirect_to backoffice_courses_path, notice: "O curso (#{course_title}) foi excluido com sucesso!"
    else
      render :index
    end
    # else
    #   redirect_to backoffice_posts_path, notice: "A categoria (#{category_name}) possui um ou mais Posts vinculados. Você deve excluir ou editar esses posts antes de excluir a categoria (#{category_name})."
    # end
  end

  def update
    #usei o before_action para rodar a função set_category
    if @course.update(params_course)
      redirect_to backoffice_courses_path, notice: "O curso (#{@course.title}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def options_for_select
      @category_options_for_select = CategoryCourse.all
      @active_options_for_select = ["Ativo", "Inativo"]
    end

    def set_course
      @course = Course.friendly.find(params[:id])
    end

    def params_course
      params.require(:course).permit(:is_active, :title, :description, :introduction_image, :firstbutton, :secondbutton, :link_sale, :price, :title_detail, :title_advantage, :detail_body, :category_course_id,
                                      testimonials_attributes:[:name, :body, :_destroy, :id],
                                      question_courses_attributes:[:query, :answer, :_destroy, :id],
                                      check_advantage_attributes:[:video, :e_book, :work_book, :meditation, :conference, :member, :access_life, :assurance, :_destroy, :id]
      )
    end

end
