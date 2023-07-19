class PagesController < ActionController::Base
    def home
        redirect_to new_user_url
    end
end