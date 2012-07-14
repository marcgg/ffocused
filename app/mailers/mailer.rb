class Mailer < ActionMailer::Base
  default_url_options[:host] = MAILER_DEFAULT_OPTIONS_HOST
  default from: MAILER_NO_REPLY_EMAIL_ADDRESS

  def forgotten_password_instructions(user)
    @user = user
    @url = edit_forgotten_password_url(user.perishable_token)
    mail(to: user.email, subject: t("forgotten_passwords.email.subject"))
  end
end
