class UsersController < ApplicationController

    include SendMail
    include JwtProvider

    def new

    end

    def create
        @article = User.create(params.require(:users).permit(:email))
        send_email_validation(params[:users][:email])
        redirect_to signup_response_path
    end

    def signup_response
        
    end

    def email_validation
        payload = verify_jwt(params["jwt"], JwtPurpose::EMAIL_VALIDATION)
        if payload
            user = User.where(email: payload["email"])
            user.update(verified: true)
        end
        render :email_validation, locals: { payload: payload }
    end

end
