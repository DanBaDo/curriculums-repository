class UsersController < ApplicationController

    #require 'mailjet'
        
    def new

    end

    def create
        @article = User.create(params.require(:users).permit(:email))
        variable = Mailjet::Send.create(messages: [{
            'From'=> {
              'Email'=> 'bytes4life@proton.me',
              'Name'=> 'Teu Curriculum'
            },
            'To'=> [
              {
                'Email'=> params[:users][:email],
                'Name'=> 'Novo usuario'
              }
            ],
            'Subject'=> 'Teu Curriculum: confirma o rexistro',
            'TextPart'=> 'Aquí irá o enlace de confirmación',
            'HTMLPart'=> '<h3>Benvido a Teu Curriculum</h3><p>Aquí irá o <a>enlace</a> de confirmación.</p>',
            #'CustomID' => ''
          }]
        )
        p variable.attributes['Messages']
        redirect_to verify_your_email_path
    end

    def verify_your_email
        
    end

end
