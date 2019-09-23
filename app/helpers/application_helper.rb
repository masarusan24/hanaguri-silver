module ApplicationHelper
  # include Redcarpet
  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new(filter_html: true, hard_wrap: true)
      options = {
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        xhtml: true,
        lax_html_blocks: true,
        strikethrough: true
      }
      @markdown = Redcarpet::Markdown.new(renderer, options)
    end
    @markdown.render(text).html_safe
  end
end
