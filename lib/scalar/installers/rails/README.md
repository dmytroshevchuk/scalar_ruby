# Getting started with Scalar on Rails

While Scalar can be used in any Ruby project, it’s especially great with [Ruby on Rails](https://rubyonrails.org).

## Setup

To use Scalar with Rails, you’ll need to install the [`scalar_ruby`](https://rubygems.org/gems/scalar_ruby) gem. Add your gem into the project Gemfile via bundler:

```bash
bundle add scalar_ruby
```

Once the gem is installed, run the install generator.

```bash
bin/rails generate scalar:install
```

This script will:

1. Update `config/routes.rb` to mount `/docs` route.
2. Generate `config/initializers/scalar.rb`
