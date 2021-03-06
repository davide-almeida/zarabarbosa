class Site::SendMailController < ApplicationController
    skip_before_action :verify_authenticity_token
    def edit
        #@admin = Admin.find(params[:id])
        @email = Setting.first.email
        @settings = Setting.first

        respond_to do |format|
            format.js
        end
    end

    def create
        @email = Setting.first.email
        #ContactMailer.send_message(@email, @email, params[:'recipient-text'], params[:'subject-text'], params[:'message-text'], params[:'name-text'], params[:'phone-text']).deliver_now
        #respond_to do |format|
        #    format.js #{ redirect_to(site_home_path, notice: 'Enviado!') }
        #end

        if verify_recaptcha(model: ContactMailer)
            ContactMailer.send_message(@email, @email, params[:'recipient-text'], params[:'subject-text'], params[:'message-text'], params[:'name-text'], params[:'phone-text']).deliver_now
            respond_to do |format|
                format.js #{ redirect_to(site_home_path, notice: 'Enviado!') }
            end
            # flash.now[:error] = "Recebemos sua mensagem. Obrigado!"
        else
            redirect_to root_path, notice: "Você deve responder o captcha corretamente!"
            respond_to do |format|
                format.js { render :action => 'teste.js.erb'}
            end
        end
    end

end
