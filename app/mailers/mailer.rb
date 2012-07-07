class Mailer < ActionMailer::Base
  default_url_options[:host] = "ffocused.com"
  default :from => "notifications@ffocused.com"

  def forgotten_password_instructions(user)
    @user = user
    @url = edit_forgotten_password_url(user.perishable_token)
    mail(:to => user.email, :subject => t("forgotten_passwords.email.subject"))
  end
end
