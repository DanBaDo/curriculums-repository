module JwtProvider

    class JwtPurpose
        EMAIL_VALIDATION = "email-validation"
    end

    def new_email_validation_jwt_for(email)
        # Provides a JWT for email validation
        # Requires JWT_SECRET and JWT_EMAIL_VALIDATION_EXPIRATION_HOURS environment variables
        # @param [string] email - The email for being verified
        # @return [string] JWT
        jwt_expiration_hours = ENV["JWT_EMAIL_VALIDATION_EXPIRATION_HOURS"].to_i
        payload = {
            email: email,
            purpose: JwtPurpose::EMAIL_VALIDATION,
            exp: (Time.now + jwt_expiration_hours.hours).to_i
        }
        JWT.encode(payload, ENV["JWT_SECRET"])
    end

    def verify_jwt(jwt, purpose)
        # Verifies JWT signature, expiration and purpose
        # Requires JWT_SECRET environment variable
        # @param [String] jwt
        # @param [JwtPurpose] purpose
        # @return [Hash|void]
        payload, = JWT.decode(jwt, ENV["JWT_SECRET"])
        if payload["purpose"] == purpose and payload["exp"] >= Time.now.to_i
            payload
        end
    end

end