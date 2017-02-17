module ApplicationHelper

  def dot_helper index, point
    index <= point ? "●" : "&nbsp;".html_safe
  end

  def header_link_to text, path
    return link_to(text, path, 'data-tg-refresh': 'page', class: ('active' if request.path == path))
  end

  def page_classes
    [
      "c-#{controller_name}",
      "a-#{action_name}",
      "lcid-#{params[:library_category_id]}",
      "id-#{params[:id]}"
      # ('large' if request.path == root_path)
    ].join(" ")
  end

  def github_user username
    link_to "https://github.com/#{username}", class: 'github-user' do
      image_tag("https://avatars1.githubusercontent.com/#{username}?v=3&s=120") + content_tag(:span, username)
    end
  end

  def image_sub text
    text = text.gsub("github.com", "raw.githubusercontent.com")
    text.gsub("/blob/master/", "/master/")
  end

  def file_info filename
    info = {
      'icon': nil,
      'type': nil
    }
    splits = filename.split(".")
    return info if splits.length == 1
    extension = splits.last.upcase
    case extension
    when "SKP"
      info['icon'] = image_tag("house-icon.svg")
      info['type'] = 'SketchUp File'
    when "MD"
      info['icon'] = image_tag("document-icon.svg")
      info['type'] = 'Markdown Document'
    when "XLS"
    when "XLSX"
      info['icon'] = image_tag("spreadsheet-icon.svg")
      info['type'] = 'Excel Spreadsheet'
    when "JPG"
      info['type'] = 'Image'
    when "PDF"
      info['type'] = 'Document'
    when "DXF"
      info['type'] = 'AutoCAD DXF'
    end

    info['icon'] ||= content_tag(:span, extension)
    return info
  end

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options.merge(itemprop: "name"))
  end

  def markdown(text)
    options = {
      filter_html:     false,
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
    content_tag :div, class: 'social-icon' do
      link_to url, title: icon_name, rel: 'me' do
        fa_stacked_icon icon_name, base: 'circle', class: 'fa-2x'
      end
    end
  end

end
