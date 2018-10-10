class AdminMailer < ApplicationMailer
    def update_email(current_admin, admin)
        @current_admin = current_admin
        @admin = admin
        mail(to: @admin.email, subject: "Seus dados foram alterados")
    end

    def send_message(email, recipient, subject, message)
        @recipient = recipient
        @email = email
        @subject = subject
        @message = message
        mail(to: @email, subject: @subject)
    end
end
