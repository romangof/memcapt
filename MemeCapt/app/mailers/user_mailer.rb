class UserMailer < ActionMailer::Base
  default from: "hackdevs16@gmail.com"
  
  def sending_email(send_to)
      @send_to = send_to

      mail(to: @send_to) do |format|
      format.html {render 'user_mailer'}
      end
  end

  def attached_email(attach, email)     
        mail(to: email, subject: "new mail" ) do |format|
        format.html {render 'user_mailer'}
        attachments["new_meme"] = File.read("img/" + attach)
        end
  end
end


=begin
class UserMailer < ActionMailer::Base
  default from: "hackdevs16@gmail.com"
  
  def sample_email(mailed_to)
      @mailed_to = mailed_to

      mail(to: @mailed_to) do |format|
      format.html {render 'user_mailer'}
      end
  end

  def attached_email(file_name, email)     
        mail(to: email, subject: "new mail" ) do |format|
        format.html {render 'user_mailer'}
        attachments["new_meme"] = File.read("img/" + file_name)
        end
  end
end
=end
