module BreadcrumbHelper
  # Builds a breadcrumb container. Attach a block that will build the
  # individual breadcrumbs using the {BreadcrumbBuilder} instance that
  # gets passed to it.
  #
  # An initial "Home" breadcrumb gets prepended to the beginning of the
  # trail by default. To override this, pass the option `skip_root: true`
  def build_breadcrumbs(options = {})
    content_for(:trailgate_crumbs) do
      builder = Trailgate::BreadcrumbBuilder.new(self)
      render(layout: 'trailgate/breadcrumbs') do
        concat builder.breadcrumb(link_to(t('trailgate.home', default: 'Home'), root_path)) unless options[:skip_root].present?
        yield builder
      end
    end
  end
end
