class Site::SettingsController < SiteController
  # skip_before_action :verify_authenticity_token
  # utilizado para desinscrever os emails dos testes
  def unsubscribe
    basic_settings
    
    email = Rails.application.message_verifier(:unsubscribe).verify(params[:id])

    # Adicionar aqui a verifiacção de subscription true/false
    if TestEmail.exists?(id: email)
      @email = TestEmail.find(email)
      if @email.subscription == true
        @email_exist = true
      else
        @email_exist = false
      end
    else
      @email_exist = false
    end

  end

  # utilizado para desinscrever os emails dos testes
  def update
    @email = TestEmail.find(params[:id])
    if @email.update(test_email_params)
        # raise
        redirect_to site_settings_unsubscribed_path, notice: "Sua inscrição foi cancelada com sucesso!"
    else
        render :unsubscribe, notice: "Houve um erro."
    end
  end

  # após cancelar a inscrição
  def unsubscribed
    basic_settings
  end

  private
    def basic_settings
      @settings = Setting.first
      @professionals = Professional.order(:id)
    end

    def test_email_params
      params.require(:test_email).permit(:subscription)
    end

end
