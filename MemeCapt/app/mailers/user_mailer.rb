class UserMailer < ApplicationMailer
  def simple_email(mailed_to)
    @mailed_to = mailed_to
      mail(to: @mailed_to) do |format|
      format.html {render 'user_mailer'}
      end
  end
end
