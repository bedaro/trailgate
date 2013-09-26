module Trailgate
  # Internal class that handles rendering breadcrumbs within the
  # containing element
  class BreadcrumbBuilder
    def initialize(helper)
      @helper = helper
      @first = true
    end
    # Add a breadcrumb and a separator. Supply either the raw output, or
    # a block to render the breadcrumb's content.
    def breadcrumb(output = nil, &block)
      ret = @helper.render layout: 'trailgate/breadcrumb', locals: { first: @first } do
        if output.present?
          @helper.concat output
        else
          yield
        end
      end
      @first = false
      ret
    end
  end
end
