module ApplicationHelper
	def link_fa_to(icon_name, text, link, solid = true, options = {})
	  link_to content_tag(:i, text, :class => "#{solid ? 'fas' : 'far'} fa-#{icon_name}"), link, options
	end
end
