class TestMailer < ApplicationMailer
    default from: 'noreply@zarabarbosa.com'
    
    def send_message(email, mail_subject, mail_body, result)
        @email = email
        @mail_subject = mail_subject
        @mail_body = mail_body
        @result = result

        mail(to: @email, subject: @mail_subject)
    end
end
