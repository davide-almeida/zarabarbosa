class Backoffice::TestEmailsController < BackofficeController
  before_action :set_test_email, only: [:edit, :update, :destroy]
  def index
    @emails = TestEmail.all
    @emails_count = TestEmail.count
  end

  def edit
    options_for_select
  end

  def update
    if @test_email.update(params_test_email)
      redirect_to backoffice_test_emails_path, notice: "O cadastro (#{@test_email.email}) foi atualizado com sucesso!"
    else
      render :index
    end
  end

  def destroy
    test_email_email = @test_email.email

    if @test_email.destroy
      redirect_to backoffice_test_emails_path, notice: "O cadastro #{test_email_email} foi excluido com sucesso!"
    else
      render :index
    end
  end

  private
    def options_for_select
      @test_email_options_for_select = PsiTest.all
      @subscription_options_for_select = [
      ["Inscrito", true], ["Cancelado", false]
    ]
    end
    def set_test_email
      @test_email = TestEmail.find(params[:id])
    end

    def params_test_email
      params.require(:test_email).permit(:email, :subscription, :psi_test_id)
    end
  
end
