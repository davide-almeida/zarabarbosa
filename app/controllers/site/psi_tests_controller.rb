class Site::PsiTestsController < ApplicationController
  layout 'psi_test'
  before_action :set_psi_test, only: [:show, :result, :save_email]

  def index
    basic_settings
    @psi_tests_count = PsiTest.where(:is_active => "Ativo").count
    if @psi_tests_count > 0
      @psi_tests = PsiTest.where(:is_active => "Ativo")
    end

  end

  def show
    basic_settings
    @test_email = TestEmail.new
    # @psi_test = PsiTest.where(:is_active => "Ativo").find(params[:id])

  end

  def save_email
    # calc sum
    # @psi_test = PsiTest.find(params[:id])

    @sum = 0
    @psi_test.test_questions.each do |question|
      question.test_alternatives.each do |alternative|
        if params["#{question.id}"]["#{alternative.id}"].present?
          @sum = @sum + alternative.rank_point
        end
      end
    end

    # Save email
    @email = params[:email]
    # @test_result = TestResult.new(email: @email, psi_test_id: params[:id])
    @test_email = TestEmail.where(:email => @email).first_or_initialize(:psi_test_id => @psi_test.id)
    @test_email.save

    if @test_email.save
      redirect_to result_site_psi_test_path(:id => params[:id], :calc => @sum), notice: "O email (#{@test_email.email}) foi cadastrado com sucesso!"
    else
      render :edit, notice: "Ocorreu um erro!"
    end
  end
  

  def result
    basic_settings

    # @psi_test = PsiTest.find(params[:id])
    @result = params["calc"]

    @psi_test.test_results.order(:rank_point_limit).each do |rule|
      if rule.condition == "<"
        if @result.to_f < rule.rank_point_limit
          @description = rule.description.html_safe
          break
        end
      elsif rule.condition == ">"
        if @result.to_f > rule.rank_point_limit
          @description = rule.description.html_safe
          break
        end
      elsif rule.condition == "="
        if @result.to_f == rule.rank_point_limit
          @description = rule.description.html_safe
          break
        end
      end

      @rule_sum = @psi_test.test_results.sum(:rank_point_limit)
      if @result.to_f > @rule_sum
        @description = "Houve um erro!"
      end

    end

  end

  private
    def basic_settings
      @settings = Setting.first
      @professionals = Professional.order(:id)
    end

    def set_psi_test
      @psi_test = PsiTest.friendly.find(params[:id])
    end

    def params_psi_test
      params.require(:psi_test).permit(
        test_emails_attributes:[:email, :_destroy, :id]
      )
    end

end
