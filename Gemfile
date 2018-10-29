source 'https://rubygems.org'

ENVIRONMENTS = %w(development production qa test).freeze
NON_PROD_ENVIRONMENTS = (ENVIRONMENTS - ['production']).freeze

####################
# Global Gems      #
####################
group(*ENVIRONMENTS) do
  gem "actionview"
  gem "activerecord"
  gem 'coffee-rails'
  gem 'httparty'
  gem 'jbuilder'
  gem 'jquery-rails'
  gem 'pg'
  gem 'pg_assets', git: 'https://github.com/ajh/pg_assets.git', branch: 'master'
  gem 'rails'
  gem 'react-rails'
  gem 'sass-rails'
  gem 'sdoc', '~> 0.4.0', group: :doc
  gem 'turbolinks'
  gem 'uglifier'
end

group(*NON_PROD_ENVIRONMENTS) do
  gem 'faker'
end

group :development do
  gem 'meta_request'
end

group :development, :test do
  gem 'pry'
  gem 'pry-awesome_print'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'shoulda-matchers', require: false
end

group :development do
  gem 'spring'
end

