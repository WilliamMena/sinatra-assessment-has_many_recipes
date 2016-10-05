# Sinatra Assessment

has_many_recipes

## Objectives

## Overview

## Instructions

### Example File Structure

```
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   ├── models
│   │   ├── recipe.rb
│   │   ├── user.rb
│   │   └── category.rb
│   ├── views
│   │   ├── index.erb
│   │   ├── layout.erb
│   │   ├── recipes
│   │   │   ├── create_recipe.erb
│   │   │   ├── edit_recipe.erb
│   │   │   ├── show_recipe.erb
│   │   │   └── recipes.erb
│   │   ├── users
│   │   │   ├── create_user.erb
│   │   │   ├── login.erb
│   │   │   └── users.erb
│   │   └── category
│   │       ├── categories.erb
│   │       └── category.erb
│   └── helper
│       └── helper.rb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 20151124191332_create_users.rb
│   │   ├── 20151124191334_create_recipes.rb
│   │   └── 20151124191336_create_categories.rb
│   │   └── 20151124191336_create_user_recipe_join.rb
│   │   └── 20151124191336_create_recipe_category_join.rb
│   ├── schema.rb
│   ├── test.sqlite
│   └── seed.rb
└── spec
    ├── controllers
    │   └── application_controller_spec.rb
    └── spec_helper.rb
```

### Gemfile and environment.rb

This project is supported by Bundler and includes a `Gemfile`.

Run bundle install before getting started on the project.

As this project has quite a few files, an `environment.rb` is included that loads all the code in your project along with Bundler. You do not ever need to edit this file. When you see require_relative `../config/environment`, that is how your environment and code are loaded.

### Models

### Migrations

### Associations

### Home Page

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/sinatra-fwitter-group-project' title='Fwitter Group Project'>Fwitter Group Project</a> on Learn.co and start learning to code for free.</p>
