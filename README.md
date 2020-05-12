# ComoSeDice

dead simple wrapper for [google-cloud-translate](https://rubygems.org/gems/google-cloud-translate/).

```ruby
ComoSeDice << "hola"  #=> "Hello"
```
peruse the spec for more examples.

set
```ruby
ENV["TRANSLATE_CREDENTIALS"] = File.expand_path("some/where/credentials.json")
ENV["TRANSLATE_PROJECT"]     = "project_name"
```
however you please.

