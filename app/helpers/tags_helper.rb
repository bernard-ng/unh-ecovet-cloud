module TagsHelper
  def icon_tag(name)
    "<em class='icon ni ni-#{name}' aria-label='#{name}'></em>".html_safe
  end

  def header_link_tag(link, label, icon)
    "<li class='nk-block-tools-opt'>
      <a href='#{link}' class='btn btn-white btn-dim btn-outline-light'>
        #{icon_tag(icon)}
        <span>#{label}</span>
      </a>
    </li>".html_safe
  end
end
