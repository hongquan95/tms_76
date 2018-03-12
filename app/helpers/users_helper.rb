module UsersHelper
  def gravatar_for user, size: Settings.users_size
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def select_option title_1, value_1, title_2, value_2
  	options_for_select([[t(title_1), value_1], [t(title_2), value_2]])
  end
end
