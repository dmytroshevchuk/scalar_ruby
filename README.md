[![Gem Version](https://badge.fury.io/rb/scalar_ruby.svg)](https://badge.fury.io/rb/scalar_ruby)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dmytroshevchuk/scalar_ruby/check.yml)](https://github.com/dmytroshevchuk/scalar_ruby/actions/workflows/check.yml)

# Scalar API Reference for Ruby

This gem simplifies the integration of [Scalar](https://scalar.com), a modern open-source developer experience platform for your APIs into Ruby applications.

## Requirements

This gem is tested and supported on the Ruby 2.7, 3.0, 3.1, 3.2, 3.3, and 3.4. Other Ruby versions might work but are not officially supported.

## Installation

Add the gem to your application's Gemfile by executing in the terminal:

```bash
bundle add scalar_ruby
```

## Getting Started

Statistically, you will likely use the gem for the Ruby on Rails application, so here are instructions on how to set up the Scalar for this framework. In the future, we'll add examples for other popular Ruby frameworks.

Once you have installed the gem, go to `config/routes.rb` and mount the `Scalar::UI` to your application.

```ruby
# config/routes.rb

Rails.application.routes.draw do
  mount Scalar::UI, at: '/docs'
  ...
end
```

Restart the Rails server, and hit `localhost:3000/docs`. You'll see the default view of the Scalar API reference. It uses the `@scalar/galaxy` OpenAPI reference so that you will have something to play with immediately.

Then, if you want to use your OpenAPI specification, you need to re-configure Scalar.

First, create an initializer, say `config/initializers/scalar.rb`. Then, set the desired specification URL via the `config.configuration` setting using the `Scalar.setup` method:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = { url: "#{ActionMailer::Base.default_url_options[:host]}/openapi.json" }
end
```

Or embed the file content directly:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = { content: File.read(Rails.root.join('docs/openapi.yml')) }
end
```

And that's it! More detailed information on other configuration options is in the section below.

## Integrations

You can use the built-in generator to set up the gem in [Ruby on Rails](https://rubyonrails.org) by running:

```bash
bin/rails generate scalar:install
```

## Configuration

Once mounted to your application, the library requires no further configuration. You can immediately start playing with the provided API reference example.

Having default configurations set may be an excellent way to validate whether Scalar fits your project. However, most users would love to utilize their specifications and adjust settings.

The default configuration can be changed using the `Scalar.setup` method in `config/initializers/scalar.rb`.

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.page_title = 'My awesome API!'
end
```

Use the `config.configuration` setting to pass your API specification and customize Scalar's appearance. The value is a hash passed directly to the Scalar JavaScript library and supports all of Scalar's native configuration options.

Pass a URL to your specification:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = { url: 'https://example.com/openapi.json' }
end
```

Or embed the file content:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = { content: File.read(Rails.root.join('docs/openapi.yml')) }
end
```

You can also set `config.configuration` to `:demo`, and the `@scalar/galaxy` spec will be used. It may come in handy if you want to try out the library.

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = :demo
end
```

### Multiple API Documents

To display multiple OpenAPI documents, use the `sources` array. The first entry is shown by default; add `default: true` to any source to override that.

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = {
    sources: [
      { title: 'Public API', url: '/openapi/public.json' },
      { title: 'Internal API', url: '/openapi/internal.json', default: true },
      { title: 'Legacy API', content: File.read(Rails.root.join('docs/legacy.yml')) }
    ]
  }
end
```

You can also apply distinct settings per document by passing an array of configuration objects instead of a single hash:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = [
    {
      title: 'Public API',
      url: '/openapi/public.json',
      theme: 'purple'
    },
    {
      title: 'Internal API',
      url: '/openapi/internal.json',
      theme: 'bluePlanet',
      default: true
    }
  ]
end
```

Each source accepts:

- `url` — absolute or relative URL to the OpenAPI document
- `content` — inline JSON or YAML string
- `title` — display name shown in the UI (auto-generated if omitted)
- `slug` — URL identifier (auto-generated from title if omitted)
- `default` — set to `true` to make this the initially displayed document

Below, you'll find a complete list of configuration settings:

Parameter                     | Description                                                                                                                                                                                           | Default
------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------
`config.page_title`           | Defines the page title displayed in the browser tab.                                                                                                                                                  | API Reference
`config.library_url`          | Allows setting a specific version of Scalar. By default, it uses the latest version, so users get the latest updates and bug fixes.                                                                   | https://cdn.jsdelivr.net/npm/@scalar/api-reference
`config.configuration`        | A hash passed directly to the Scalar JavaScript library. Accepts all [Scalar configuration options](https://github.com/scalar/scalar/blob/main/documentation/configuration.md) (e.g. `url`, `content`, `sources`, `theme`). Set to `:demo` to use the `@scalar/galaxy` demo spec. | `{}`

Example of setting configuration options:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.configuration = {
    theme: 'purple',
    url: 'https://example.com/openapi.json'
  }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Run `bundle exec rake install` to install this gem onto your local machine. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dmytroshevchuk/scalar_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dmytroshevchuk/scalar_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Scalar::Ruby project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](https://github.com/dmytroshevchuk/scalar_ruby/blob/master/CODE_OF_CONDUCT.md).
