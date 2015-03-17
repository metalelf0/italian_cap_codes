# ItalianCapCodes

This engine provides three models and relative data for italian regions, provinces and comunes.

Once installed you'll have three models in your app:

* `ItalianCapCodes::Region`
* `ItalianCapCodes::Province`
* `ItalianCapCodes::Comune`

Each of these models is ready to use in your app (relations, indexes etc. are already set up).

## Installation

```
# add gem to Gemfile
gem 'italian_cap_codes',  github: 'metalelf0/italian_cap_codes'

# copy migrations and run them
$ rake italian_cap_codes:install:migrations
$ rake db:migrate

# add seed to your db/seeds.rb file:
ItalianCapCodes::Engine.load_seed

# run your seed:
$ rake db:seed
```

## Changelog

### v 0.0.2

* added `Region.comunes` relation via `has_many :comunes, through: :provinces`

### v 0.0.1

* first commit

# Disclaimer

The idea for this app is taken from [dbraga/italian-cap-codes](https://github.com/dbraga/italian-cap-codes). Thank you!
