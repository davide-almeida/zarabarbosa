class Site::PsiTestsController < ApplicationController
  layout 'psi_test'
  before_action :set_psi_test, only: [:show, :result, :save_email]
  before_action { :first_time_visit }

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
    @rank_point = @sum
    # @test_result = TestResult.new(email: @email, psi_test_id: params[:id])
    @email_check = TestEmail.find_by_email(@email)
    @test_email = TestEmail.new
    if @email_check == nil
      @test_email = TestEmail.new(email: @email, rank_point: @rank_point, psi_test_id: @psi_test.id)
      @test_email.save
    else
      @email_check.update_column(:rank_point, @rank_point)
    end

    # raise
    # @test_email = TestEmail.where(:email => @email).first_or_initialize(:psi_test_id => @psi_test.id)
    # @test_email.save

    # send email
    calc(@sum)
    @mail_subject = @psi_test.title
    @mail_body = @description.html_safe
    @result = @sum
    TestMailer.send_message(@email, @mail_subject, @mail_body, @sum).deliver_later


    if (@test_email.save) || (@email_check.update(:rank_point => @rank_point))
      redirect_to result_site_psi_test_path(:id => params[:id], :calc => @sum), notice: "O resultado do teste será exibido!"
    else
      render :edit, notice: "Ocorreu um erro!"
    end
  end
  

  def result
    basic_settings
    @result = params[:calc]
    calc(@result)

  end

  private
    def basic_settings
      @settings = Setting.first
      @professionals = Professional.order(:id)
    end

    # função para calcular a soma dos pontos e retornar um resultado com o texto (testes)
    def calc(calc_sum)
      @result = calc_sum
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

    def set_psi_test
      @psi_test = PsiTest.friendly.find(params[:id])
    end

    def params_psi_test
      params.require(:psi_test).permit(
        test_emails_attributes:[:email, :_destroy, :id]
      )
    end

end
