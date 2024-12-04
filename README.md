[![Gem Version](https://badge.fury.io/rb/scalar_ruby.svg)](https://badge.fury.io/rb/scalar_ruby)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dmytroshevchuk/scalar_ruby/check.yml)](https://github.com/dmytroshevchuk/scalar_ruby/actions/workflows/check.yml)

# Scalar API Reference for Ruby

This gem simplifies the integration of [Scalar](https://scalar.com), a modern open-source developer experience platform for your APIs into Ruby applications.

## Requirements

This gem is tested and supported on the following Ruby versions:

- Ruby 3.0, 3.1, 3.2, 3.3

Other Ruby versions might work but are not officially supported.

## Installation

Add the gem to your application's Gemfile by executing in the terminal:

```bash
bundle add scalar_ruby
```

## Getting Started

#### Integrations
You can use in-build generator to setup gem into [Ruby in Rails](https://rubyonrails.org) framework followed by instructions:

Setup gem with [Ruby on Rails](lib/scalar/installers/rails/README.md)

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

Then, if you want to use your OpenAPI specification, you need to re-configure the Scalar.

First, create an initializer, say `config/initializers/scalar.rb`. Then, set the desired specification as `config.specification` using the `Scalar.setup` method:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.specification = File.read(Rails.root.join('docs/openapi.yml'))
end
```

Also, you can pass a URL to the specification:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
  config.specification = "#{ActionMailer::Base.default_url_options[:host]/openapi.json}"
end
```

And that's it! More detailed information on other configuration options is in the section below.

## Configuration

Once mounted to your application, the library requires no further configuration. You can immediately start playing with the provided API reference example.

Having default configurations set may be an excellent way to validate whether the Scalar fits your project. However, most users would love to utilize their specifications and be able to alter settings.

The default configuration can be changed using the `Scalar.setup` method in `config/initializers/scalar.rb`.

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
 config.page_title = 'My awesome API!'
end
```

Below, you’ll find a complete list of configuration settings:

Parameter                                  | Description                                             | Default
-------------------------------------------|---------------------------------------------------------|------------------------
`config.page_title`                        | Defines the page title displayed in the browser tab.    | API Reference
`config.library_url`                       | Allows to set a specific version of Scalar. By default, it uses the latest version of Scalar, so users get the latest updates and bug fixes.   | https://cdn.jsdelivr.net/npm/@scalar/api-reference
`config.scalar_configuration`              | Scalar has a rich set of configuration options if you want to change how it works and looks. A complete list of configuration options can be found [here](https://github.com/scalar/scalar/blob/main/documentation/configuration.md).   | {}
`config.specification`                     | Allows users to pass their OpenAPI specification to Scalar. It can be a URL to specification or a string object in JSON or YAML format.    | https://cdn.jsdelivr.net/npm/@scalar/galaxy/dist/latest.yaml

Example of setting configuration options:

```ruby
# config/initializers/scalar.rb

Scalar.setup do |config|
 config.scalar_configuration = { theme: 'purple' }
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

Everyone interacting in the Scalar::Ruby project’s codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](https://github.com/dmytroshevchuk/scalar_ruby/blob/master/CODE_OF_CONDUCT.md).
