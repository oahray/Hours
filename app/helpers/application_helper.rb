module ApplicationHelper

  def nav_path(link_text, link_path, http_method=nil)
    css_class = "navigation"
    css_class << " current" if current_page?(link_path)
    content_tag :li, class: css_class do
      link_to(link_text, link_path, http_method)
    end
  end

  def user_image_link(user, opts={}, &block)
    link_to user_entries_path(user) do
      if opts[:border]
        concat gravatar_image_tag user.email, class: "image-circle", style: "border: 3px solid #{user.full_name.pastel_color}"
      else
        concat gravatar_image_tag user.email, class: "image-circle"
      end
      concat yield if block_given?
    end
  end
end
