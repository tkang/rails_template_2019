# Rails Template 2018

This is a template project to help you get started with a new Rails project with TDD.

For details on which gems are used, please refer to Gemfile.

### Installation

- rbenv + ruby-build is recommended to manage ruby version (.ruby-version) and where gemfiles get installed (.ruby-gemset)
- To install rbenv : https://github.com/rbenv/rbenv
- To install ruby-build : https://github.com/rbenv/ruby-build

### Configuration

* Installing gemfiles
```
bundle install
```

* Database initialization
```
rake db:create
rake db:migrate
```

* Running tests

```
rake db:test:prepare
rspec spec
```


