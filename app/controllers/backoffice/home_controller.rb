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
    @contador_courses = Course.count
    @contador_courses_active = Course.where(is_active: "Ativo").count
    @contador_courses_inactive = Course.where(is_active: "Inativo").count

  end
end
