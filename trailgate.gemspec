$:.push File.expand_path("../lib", __FILE__)

require "trailgate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "trailgate"
  s.version     = Trailgate::VERSION
  s.authors     = ["Ben Roberts"]
  s.email       = ["ben_roberts@terpalum.umd.edu"]
  s.description = <<-EOF
    Trailgate is a gem for making Rails breadcrumb trails. It has a
    combination of features which make it unique from the many other
    breadcrumb gems out there: all integration is done at the view level,
    breadcrumbs are rendered with partial views that can be overridden and
    customized, and it stays out of the business of generating the trail
    (i.e. you can write your own helpers to handle complex trail logic).
  EOF
  s.summary     = %q{A simple, view-level, flexible breadcrumb helper}
  s.homepage    = "https://github.com/bedaro/trailgate"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
