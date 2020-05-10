# AndyDNA::Google::Translate

Dead simple wrapper for [https://rubygems.org/gems/google-cloud-translate/](google-cloud-translate).

```ruby
GoogleTranslate << "hola"  #=> "Hello"
```

set
```ruby
ENV["TRANSLATE_CREDENTIALS"] = File.expand_path("some/where/credentials.json")
ENV["TRANSLATE_PROJECT"]     = "project_name"
```
however you may please.

