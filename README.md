# ruby_app

## Structure

```
.
├── Gemfile
├── README.md
├── rakefile.rb
├── src
│   └── Loader.rb
│   └── WebLog.rb
├── test
│   └── loader_test.rb
│   └── web_log_test.rb
└── test_helper.rb
```

* `app.rb` - Script file to execute the program outputting results to console
* `Gemfile` - Gemfile for project.
* `README.md` - this file.
* `rakefile.rb` - rake task to run test suite.
* `src` - Contains a Loader Class which parses webserver.log creating array of WebLog (using WebLog Class) instance objects for enumerating the most page views and unique page views.
* `test` - Tests for Loader and WebLog classes.
* `test_helper.rb` - configuration file for MiniTest

## Getting started

```
$ bundle install
```

## Run the tests

```
$ rake test
```

## View the coverage report

```
$ open coverage/index.html
```

## Run the console command below to execute the program and view its output

```
$ ruby app.rb "webserver.log"
```
