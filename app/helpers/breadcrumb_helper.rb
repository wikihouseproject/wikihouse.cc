module BreadcrumbHelper
  def breadcrumbs
    safe_join(breadbrumb_items, " / ")
  end

  def breadbrumb_items
    @node.self_and_ancestors.reverse.map do |breadcrumb|
      link_to(breadcrumb.title, node_path(breadcrumb))
    end
  end
end
