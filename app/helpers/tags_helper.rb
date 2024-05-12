module TagsHelper
  def icon_tag(name)
    "<em class='icon ni ni-#{name}' aria-label='#{name}'></em>".html_safe
  end
end
