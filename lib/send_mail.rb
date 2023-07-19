module SendMail

  include JwtProvider

  def send_email_validation(email)
    # Abstraction for sending email validation URL
    # @param [String] email
    # @return [void]
    jwt = new_email_validation_jwt_for email
    email_validation_url = request.base_url+email_validation_path+"?jwt="+jwt
    delivery = Mailjet::Send.create(messages: [{
      'From': {
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
      'TextPart'=> "
Se acabas de darte de alta no noso servicio confirma a túa alta
accedendo a este enlace de verificación:
#{email_validation_url}.
Se non fuches tí quen se deu de alta, non te preocupes. Non tes que facer nada.
",
      'HTMLPart'=> "
<h3>Benvido a Teu Curriculum</h3>
<p>
  Se acabas de darte de alta no noso servicio cnafirma a túa alta
  accedendo a este <a href=\"#{email_validation_url}\">enlace de verificación</a>.
</p>
<p>
  Se non fuches tí quen se deu de alta, non te preocupes. Non tes que facer nada.
</p>
",
    }])
    p delivery.attributes['Messages'] if Rails.env.development?
  end

end