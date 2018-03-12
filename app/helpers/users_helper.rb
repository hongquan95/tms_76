module UsersHelper
  def gravatar_for user, size: Settings.users_size
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-thumbnail")
  end

  def select_option option_trainer, value_trainer, option_trainee, value_trainee
    options_for_select([[t(option_trainer), value_trainer], [t(option_trainee), value_trainee]])
  end

  def load_role
    @roles ||= User.roles.map{|k, v| [t(".#{k}"), v]}
  end
end
