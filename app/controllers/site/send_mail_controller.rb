class Site::SendMailController < ApplicationController
    skip_before_action :verify_authenticity_token
    def edit
        #@admin = Admin.find(params[:id])
        @email = Setting.first.email

        respond_to do |format|
            format.js
        end
    end

    def create
        @email = Setting.first.email
        AdminMailer.send_message(params[:'recipient-text'], @email, params[:'subject-text'], params[:'message-text']).deliver_now
        respond_to do |format|
            format.js #{ redirect_to(site_home_path, notice: 'Enviado!') }
        end
    end

end
