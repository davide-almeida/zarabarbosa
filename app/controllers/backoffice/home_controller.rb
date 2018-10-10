class Backoffice::HomeController < BackofficeController
  def index
    @status = admin_signed_in?
    if @status == true
      @status = "Autenticado"
    else
      @status == "Não autenticado"
    end

    #Contadores
    @contador_flags = Flag.count
    @contador_services = Service.count
    @contador_health_insurances = HealthInsurance.count
    @contador_posts = Post.count

  end
end
