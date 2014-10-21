module ApplicationHelper

	def link_to_active_class(name, active_class_names, options = {}, html_options = {}, &block)
	  html_options[:class] = html_options[:class].to_s + active_class_names if current_page?(options.to_s)
	  link_to name, options, html_options, &block
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
end
