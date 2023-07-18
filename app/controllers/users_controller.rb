class UsersController < ApplicationController

    include SendMail

    def new

    end

    def create
        @article = User.create(params.require(:users).permit(:email))
        send_email_validation(params[:users][:email])
        redirect_to verify_your_email_path
    end

    def verify_your_email
        
    end

end
