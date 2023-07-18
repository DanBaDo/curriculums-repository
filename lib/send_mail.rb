module SendMail
    def send_email_validation(email)
      # Abstraction for sending email validation URL
      # @param [String] email
      # @return [void]
      delivery = Mailjet::Send.create(messages: [{
          'From'=> {
            'Name'=> 'Teu Curriculum',
            'Email'=> 'bytes4life@proton.me',
          },
          'To'=> [
            {
              'Email'=> email,
              'Name'=> 'Novo usuario'
            }
          ],
          'Subject'=> 'Teu Curriculum: confirma o teu rexistro',
          'TextPart'=> 'Aquí irá o enlace de confirmación',
          'HTMLPart'=> '<h3>Benvido a Teu Curriculum</h3><p>Aquí irá o <a>enlace</a> de confirmación.</p>',
        }]
      )
      p delivery.attributes['Messages'] if Rails.env.development?
    end
end