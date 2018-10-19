class AdminMailer < ApplicationMailer
    def update_email(current_admin, admin)
        @current_admin = current_admin
        @admin = admin
        mail(to: @admin.email, subject: "Seus dados foram alterados")
    end

    def send_message(email, recipient, recipient_contact, subject_contact, message_contact, name_contact, phone_contact)
        @email = email
        @recipient = recipient
        @recipient_contact = recipient_contact
        @subject_contact = subject_contact
        @message_contact = message_contact
        @name_contact = name_contact
        @phone_contact = phone_contact

        mail(to: @email, subject: @subject_contact)
    end
end
