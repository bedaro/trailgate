# Trailgate

Trailgate is a gem for making Rails breadcrumb trails. It has a
combination of features which make it unique from the many other
breadcrumb gems out there:

* All integration is done at the view level. Your controllers aren't touched.
* Breadcrumbs are rendered with partial views that can be overridden and
  customized.
* It stays out of the business of generating the trail (i.e. you can write
  your own helpers to handle complex trail logic). You define the trail in
  the view, not in your application routing.

## Installation

Add this line to your application's Gemfile:

    gem 'trailgate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trailgate

## Usage

Add this to wherever you want the breadcrumb trail to show, such as in your
layout view:

```ruby
yield :trailgate_crumbs if content_for?(:trailgate_crumbs)
```

This will include a breadcrumb trail for a given view only if that view
includes this:

```ruby
build_breadcrumbs do |b|
  b.breadcrumb 'Breadcrumb content'
end
```

The above example would produce the trail:

    _Home_ > Breadcrumb content

`build_breadcrumbs` passes an object to its block that can construct
breadcrumbs. Its `breadcrumb` method will accept anything suitable for
output to the page, or a block. For example:

```ruby
b.breadcrumb do
  if @post.type == :page
    link_to 'Pages', pages_path
  else
    link_to 'Posts', posts_path
  end
end
b.breadcrumb link_to @post.title, @post
```

You can embed as much logic into the block passed to `build_breadcrumbs` as
you need or, preferably, call a helper to handle anything really complex. To
keep things DRY, you can also merge your breadcrumb trails into one or more
shared partial views. In this way, trailgate can scale from the simplest to
the most complex of breadcrumb requirements.

## Customizing

The breadcrumb trail is rendered using partial views built in to the gem that
produce markup for Twitter Bootstrap. If you want to change this, create
partial views in your app for `trailgate/breadcrumbs` and
`trailgate/breadcrumb`.

The default for `trailgate/breadcrumbs` is:

    <ul class="breadcrumb">
      <%= yield %>
    </ul>

The default for `trailgate/breadcrumb` is:

    <li>
      <% unless first %>
        <span class="divider">&gt;</span>
      <% end %>
      <%= yield %>
    </li>

`build_breadcrumbs` inserts a "Home" link at the beginning of the trail by
default. To disable this:

```ruby
build_breadcrumbs skip_root: true do |b|
  # ...
end
```

If you need to change the text of the "Home" link, define "trailgate.home" in
your language file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
