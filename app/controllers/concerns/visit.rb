module Visit
    extend ActiveSupport::Concern
    
    # before_action :first_time_visit, unless: -> { cookies[:first_visit] }

    # def first_time_visit
    #     cookies.permanent[:first_visit] = 1
    #     @first_visit = true
    # end

    # if @first_visit
    #     @cookies = "Exibe o modal!"
    # else
    #     @cookies = "não exibe"
    # end

    # def soma(a, b)
    #     a + b
    # end

end