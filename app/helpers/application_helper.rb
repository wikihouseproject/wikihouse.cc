module ApplicationHelper

  def github_user username
    link_to "https://github.com/#{username}", class: 'github-user' do
      image_tag("https://avatars1.githubusercontent.com/#{username}?v=3&s=80") + content_tag(:span, username)
    end
  end

  def file_icon filename
    extension = filename.split(".").last.upcase
    case extension
    when "SKP"
      image_tag("house-icon.svg")
    when "MD"
      image_tag("document-icon.svg")
    when "XLS"
    when "XLSX"
      image_tag("spreadsheet-icon.svg")
    else
      content_tag(:span, extension)
    end
  end

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options.merge(itemprop: "name"))
  end

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def social_icon icon_name, url
    content_tag :li, class: 'social-icon' do
      link_to url, title: icon_name, rel: 'me' do
        fa_stacked_icon icon_name, base: 'circle', class: 'fa-2x'
      end
    end
  end

end
